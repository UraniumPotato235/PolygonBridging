# Project Descprition

Polygon Proof of Stake: For this project, you will deploy an NFT collection on the Ethereum blockchain, Map the collection to Polygon, and Transfer assets over via the Polygon Bridge. To put a twist on the project, use an image generation tool - like [DALLE 2](https://openai.com/dall-e-2/) or [Midjourney](https://www.midjourney.com/) - to the images for your NFTs.


## Requirements 

To successfully complete the Final Challenge, your project should:

1. Generate a 5-item collection using DALLE 2 or Midjourney
2. Store items on IPFS using [pinata.cloud](http://pinata.cloud/)
3. Deploy an ERC721 or ERC1155 to the Goerli Ethereum Testnet

* You should have a `promptDescription` function on the contract that returns the prompt you used to generate the images

4. Map Your NFT Collection using [Polygon network token mapper](https://mapper.polygon.technology/). Note: this isn’t necessary but helpful for visualization.
5. Write a hardhat script to batch mint all NFTs. Hint: ERC721A is optimal here.
6. Write a hardhat script to batch transfer all NFTs from Ethereum to Polygon Mumbai using the [FxPortal Bridge](https://wiki.polygon.technology/docs/pos/design/bridge/l1-l2-communication/fx-portal/)

* Approve the NFTs to be transferred
* Deposit the NFTs to the Bridge
* Test `balanceOf` on Mumbai

## Prerequisites

Before running the scripts, make sure you have the following set up:

- Node.js and npm installed on your machine.
- Hardhat development environment set up.

## Setup

1. Clone the project repository.
2. Install the project dependencies by running `npm install` in the project directory.

## Lexica and IPFS

1. Use Lexica to generate a 5-item collection of images.
2. Upload the images to IPFS using pinata.cloud.
3. Update the `baseUrl` variable in the `NFT.sol` contract with the IPFS base URL where the images are stored.

## Deploy ERC721A Contract

1. Update the contract name and symbol as needed in the `NFT.sol` contract.
2. Run the deployment script `deploy.js` to deploy the ERC721A contract to the Goerli Ethereum Testnet.

```bash
npx hardhat run scripts/deploy.js --network goerli
```

3. Note down the deployed contract address.

## Batch Mint NFTs

1. Run the batch minting script `batchMint.js` to mint 5 NFTs using the deployed contract address and your private key.

```bash
 npx hardhat run scripts/batchMint.js --network goerli
```

## Batch Transfer NFTs to Polygon Mumbai

1. Run the batch transfer script `batchTransferNft.js` to transfer the minted NFTs from Ethereum to Polygon Mumbai using the FxPortal Bridge.

```bash
npx hardhat run scripts/batchTransferNft.js --network goerli
```

2. The script will approve the NFTs for transfer and then deposit them to the FxPortal Bridge.

## Check Mumbai Balance

1. After the bridging process is completed, you can check the balance of the NFTs on the Polygon Mumbai network.

## ERC721A Contract Functions

The ERC721A contract has the following functions:

- `mint(uint256 quantity)`: Allows the contract owner to mint NFTs. Only the contract owner can execute this function.
- `promptDescription()`: Returns an array of strings containing the prompt descriptions used to generate the NFT images.

## Note

- Make sure to add a .env file and add your account's Private Key in the file.
- You can customize the number of NFTs to be minted and the base URL for the images in the `batchMint.js` script and the `NFT.sol` contract, respectively.

Please ensure that you are running these scripts on testnets for experimentation purposes only. Do not use real assets or private keys on testnets. Additionally, ensure that you have enough testnet tokens for gas fees while running these scripts.
