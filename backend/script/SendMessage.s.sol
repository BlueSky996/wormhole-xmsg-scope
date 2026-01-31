// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


import "forge-std/Script.sol";
import "../src/SourceMessenger.sol";

contract sendMessage is Script {
    function run() external {
        vm.startBroadcast();
        SourceMessenger(0xd4e095Ca2381C0dA7af8FDcD947962c82E919F87).sendMessage{value: 0}(
            abi.encode("Hello Wormhole We are going from Sepolia To Base!")
        );
        vm.stopBroadcast();

    }
}