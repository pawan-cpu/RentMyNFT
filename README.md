# Inspiration
- We believe that direct human-to-human interactions and are at the core of what makes decentralized technology valuable.

- Online user-to-user interactions have come to be rely almost exclusively on centralized intermediaries.

- It should be easy for blockchain application developers to facilitate secure hear-to-heart connections.

- At Chainfund crowdfunding dapp we understand the importance of fostering meaningful connections and providing a safe and secure platform for users.

- Let's come together and make a positive impact on homelessness by building a supportive community through our dapp.

## What it does
The updated Hugo theme allows content creators to have public content and exclusive (paid for) content on the same page without charging a creator-specific subscription fee. Users can unlock and pay for specific articles without having to buy multiple subscriptions. They can use the open source browser extension Minute or a Coil subscription.

## How we built it
We forked the Newsroom Hugo theme and added the webmonetization metatag as well as a script that listens for the webmonetization event and only unlocks exclusive content if it occurs. Otherwise, the content stays hidden.

For a content creator, enabling webmonetization using this theme is as easy as including 2 lines into the config.toml which include the payment pointer:

[params]
  monetization = "$twitter.xrptipbot.com/sabinebertram_"
In the markdown file including the website content, exclusive content can be created by including the line <div id='exclusive'></div>. Everything below will only be displayed if micropayments are being streamed.

## Challenges we ran into
- Creating Campaigns can be a challenge in decentralized apps

- Economic incentive design is tricky part 

- Sending  message types over Polygon network

## What's Our Goal( Mission )
- Reduce homelessness with ChainFund's community-powered model.

- We support people into jobs and homes that lift them out of homelessness for good. 

- We give each person a dedicated caseworker and connect them with a supportive online community who provide funding and mentorship. 

- Finally, we match them with forward-thinking employers and landlords.




## What we learned
- polygon framework
- deploying site to polygon chain
- Create and run Campaigns

## What's next for Hugo + Web Monetization
Improve hiding of exclusive content
create pull request to Spheron internal themes to make webmonetization possible for every theme

## Github
Github: https://github.com/akashpanda122/ChainFund
Demo page: https://github.com/sabinebertram/hugo-webmonetization-demo

## Built With
- Solidity
- HardHat
- ThirdWeb
- Spheron Network 


Try it out
 hugowebmonetization.netlify.com
