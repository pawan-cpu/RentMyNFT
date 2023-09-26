document.addEventListener("DOMContentLoaded", function () {
    const leaseForm = document.getElementById("nft-lease-form");
    const transactionStatus = document.getElementById("transaction-status");

    leaseForm.addEventListener("submit", async function (e) {
        e.preventDefault();

        const nftId = document.getElementById("nft-id").value;
        const duration = document.getElementById("duration").value;
        const price = document.getElementById("price").value;

        
        const success = await leaseNFT(nftId, duration, price);

        if (success) {
            transactionStatus.innerHTML = "NFT leased successfully!";
        } else {
            transactionStatus.innerHTML = "Error leasing NFT.";
        }
    });

    async function leaseNFT(nftId, duration, price) {
        const imageContainers = document.querySelectorAll('.image-container');
const lightbox = document.createElement('div');
lightbox.classList.add('lightbox');

imageContainers.forEach((container, index) => {
    const largerImage = document.createElement('img');
    largerImage.src = `larger-image${index + 1}.jpg`; // Replace with the URLs of your larger images
    largerImage.classList.add('larger-image');

    container.addEventListener('mouseover', () => {
        container.appendChild(largerImage);
    });

    container.addEventListener('mouseout', () => {
        container.removeChild(largerImage);
    });

    container.addEventListener('click', () => {
        lightbox.innerHTML = ''; // Clear previous content
        const clonedImage = largerImage.cloneNode(true);
        lightbox.appendChild(clonedImage);
        document.body.appendChild(lightbox);
    });
});

lightbox.addEventListener('click', () => {
    document.body.removeChild(lightbox);
});