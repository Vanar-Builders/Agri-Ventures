// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmListing {
    struct Farm {
        uint id;
        string name;
        string location;
        address owner;
        bool isListed;
    }

    Farm[] public farms;
    uint public farmCount;

    event FarmListed(uint id, string name, string location, address owner);

    function listFarm(string memory _name, string memory _location) public {
        farms.push(Farm(farmCount, _name, _location, msg.sender, true));
        emit FarmListed(farmCount, _name, _location, msg.sender);
        farmCount++;
    }

    function getFarms() public view returns (Farm[] memory) {
        return farms;
    }
}
