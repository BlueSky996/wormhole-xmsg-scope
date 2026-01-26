// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./interfaces/IWormhole.sol";

contract SourceMessenger {
    IWormhole public wormhole;
    uint8 public constant CONSISTENCY_LEVEL = 1;

    constructor(address _wormhole){
        wormhole = IWormhole(_wormhole);
    }

    function sendMessage(bytes memory payload) external payable{
        wormhole.publishMessage{value: msg.value}(
            0, payload, CONSISTENCY_LEVEL
        );
    }

}