// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./interfaces/IWormhole.sol";

contract TargetMessenger {
    IWormhole public wormhole;
    bytes public lastMessage;

    constructor(address _wormhole) {
        wormhole = IWormhole(_wormhole);
        
    }

    function receiveMessage(bytes calldata encodedVM) external {
        (
            IWormhole.VM memory vm,
            bool valid,
            string memory reason
        ) = wormhole.parseAndVerifyVm(encodedVM);

        require(valid, reason);

        lastMessage = vm.payload;
    } 
}