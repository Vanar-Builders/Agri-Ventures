// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TicketNFT is ERC721URIStorage, Ownable(0x4E28d308A04700714677190fB742Cf674dBe440C) {
    uint256 public nextTokenId;
    uint256 public ticketPrice;

    constructor(uint256 _ticketPrice) ERC721("FarmVisitTicket", "FVT") {
        ticketPrice = _ticketPrice;
    }

    function mintTicket(string memory uri) external payable {
        require(msg.value > ticketPrice, "Incorrect amount sent");

        // Mint the NFT to the buyer
        _safeMint(msg.sender, nextTokenId);
        _setTokenURI(nextTokenId, uri);

        nextTokenId++;

        // Transfer the payment to the contract owner
        payable(owner()).transfer(msg.value);
    }

    function setTicketPrice(uint256 _ticketPrice) external onlyOwner {
        ticketPrice = _ticketPrice;
    }
}
