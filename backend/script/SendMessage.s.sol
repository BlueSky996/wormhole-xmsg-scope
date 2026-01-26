// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


import "forge-std/Script.sol";
import "../src/SourceMessenger.sol";

contract sendMessage is Script {
    function run() external {
        vm.startBroadcast();
        SourceMessenger(SOURCE_CONTRACT).sendMessage{value: 0.01 ether}(
            abi.encode("hello wormhole")
        );
        vm.stopBroadcast();

    }
}