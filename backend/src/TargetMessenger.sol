// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./interfaces/IWormhole.sol";

contract TargetMessenger {
    IWormhole public wormhole;
    bytes public lastMessage;

    constructor(address _wormhole) {
        wormhole = IWormhole(_wormhole);
        
    }

    function receiveMessage(bytes memory payload) external {
        // later: restrict caller to wormhole relayer / verfiy VAA
        lastMessage = payload;
    }
}