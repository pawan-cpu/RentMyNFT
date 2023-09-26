// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/utils/SafeERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTLeaseContract is Ownable {
    using SafeERC721 for IERC721;

    struct Lease {
        address owner;
        address tenant;
        uint256 tokenId;
        uint256 startTime;
        uint256 endTime;
        uint256 leasePrice;
        bool active;
    }

    IERC721 public nftToken;
    uint256 public nextLeaseId = 1;
    uint256 public leaseDuration = 30 days;
    uint256 public leaseFee = 0.01 ether;

    mapping(uint256 => Lease) public leases;

    event LeaseCreated(uint256 indexed leaseId, address indexed owner, address indexed tenant, uint256 tokenId);
    event LeaseEnded(uint256 indexed leaseId, address indexed owner, address indexed tenant, uint256 tokenId);

    constructor(address _nftTokenAddress) {
        nftToken = IERC721(_nftTokenAddress);
    }

    function createLease(uint256 _tokenId) external payable {
        require(msg.value == leaseFee, "Incorrect lease fee");
        require(nftToken.ownerOf(_tokenId) == msg.sender, "You do not own this NFT");
        require(!leases[_tokenId].active, "NFT is already leased");

        Lease storage newLease = leases[_tokenId];
        newLease.owner = msg.sender;
        newLease.tenant = address(0); // No tenant initially
        newLease.tokenId = _tokenId;
        newLease.startTime = block.timestamp;
        newLease.endTime = block.timestamp + leaseDuration;
        newLease.leasePrice = msg.value;
        newLease.active = true;

        emit LeaseCreated(nextLeaseId, msg.sender, address(0), _tokenId);
        nextLeaseId++;
    }

    function endLease(uint256 _tokenId) external {
        Lease storage lease = leases[_tokenId];
        require(lease.active, "NFT is not leased");
        require(msg.sender == lease.tenant || msg.sender == lease.owner, "You are not authorized to end this lease");
        require(block.timestamp >= lease.endTime, "Lease period not over yet");

        address owner = lease.owner;
        address tenant = lease.tenant;
        uint256 refundAmount = lease.leasePrice;

        lease.active = false;
        lease.tenant = address(0);

        if (msg.sender == tenant) {
            nftToken.safeTransferFrom(address(this), tenant, _tokenId);
        } else {
            payable(owner).transfer(refundAmount);
        }

        emit LeaseEnded(_tokenId, owner, tenant, _tokenId);
    }
}
