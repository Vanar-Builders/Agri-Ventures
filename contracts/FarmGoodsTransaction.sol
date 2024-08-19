// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmGoodsTransaction {
    event Purchase(address indexed buyer, address indexed seller, uint256 amount);

    function purchase(address payable seller) external payable {
        require(msg.value > 0, "Send some ether");
        seller.transfer(msg.value);
        emit Purchase(msg.sender, seller, msg.value);
    }
}
