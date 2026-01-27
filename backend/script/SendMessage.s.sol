// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


import "forge-std/Script.sol";
import "../src/SourceMessenger.sol";

contract sendMessage is Script {
    function run() external {
        vm.startBroadcast();
        SourceMessenger(0x1234567890abcdef1234567890abcdef12345678).sendMessage{value: 0.01 ether}(
            abi.encode("hello wormhole")
        );
        vm.stopBroadcast();

    }
}