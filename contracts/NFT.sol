// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "erc721a/contracts/ERC721A.sol";

// To successfully complete the Final Challenge, your project should:

// Generate a 5-item collection using DALLE 2 or Midjourney
// Store items on IPFS using pinata.cloud
// Deploy an ERC721 or ERC1155 to the Goerli Ethereum Testnet
// You should have a promptDescription function on the contract that returns the prompt you used to generate the images
// Map Your NFT Collection using Polygon network token mapper. Note: this isn’t necessary but helpful for visualization.
// Write a hardhat script to batch mint all NFTs. Hint: ERC721A is optimal here.
// Write a hardhat script to batch transfer all NFTs from Ethereum to Polygon Mumbai using the FxPortal Bridge
// Approve the NFTs to be transferred
// Deposit the NFTs to the Bridge
// Test balanceOf on Mumbai

contract NFT is ERC721A {
    address public owner;

    // Base url for the nfts
    string baseUrl =
        "https://gateway.pinata.cloud/ipfs/QmSZSs9ggwQsZUCBAXhnBp3NEcZ6C9gUZb2QVpCcwMnnDn";

    //  for the prompt description
    string[] public description ;
    constructor() ERC721A("ANKIT", "ANK") {
        owner = msg.sender;
    }

    // Modifier that only allows the owner to execute a function
    modifier ownerAllowed() {
        require(msg.sender == owner, "Only owner can perform this action!");
        _;
    }

    function promptUsed()public {
        description.push("Pikachu as Batman");
        description.push("Pikachu as spiderman");
        description.push("Pikachu as ironman");
        description.push("Pikachu fighting batman");
        description.push("Pikachu as emperor of the world");
    }
    // Function to mint NFT which only owner can perform
    function mint(uint256 quantity) external payable ownerAllowed() {
        require(quantity <= 5,"only 5 nfts to be minted");
            
        _mint(msg.sender, quantity);
    }

    // Override the baseURI function to return the base URL for the NFTs
    function _baseURI() internal view override returns (string memory) {
        return baseUrl;
    }

    // Return the URL for the prompt description
    function promptDescription() external view returns (string[] memory) {
        return description;
    }
}
