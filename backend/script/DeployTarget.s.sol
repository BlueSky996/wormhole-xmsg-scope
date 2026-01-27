// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/TargetMessenger.sol";


contract DeployTarget is Script {
    function run() external {
        vm.startBroadcast();
        new TargetMessenger(0x79A1027a6A159502049F10906D333EC57E95F083);
        vm.stopBroadcast();
    }
}