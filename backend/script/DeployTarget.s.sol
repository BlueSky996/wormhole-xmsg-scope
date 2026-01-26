// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/TargetMessenger.sol";


contract DeployTarget is Script {
    function run() external {
        vm.startBroadcast();
        new TargetMessenger();
        vm.stopBroadcast();
    }
}