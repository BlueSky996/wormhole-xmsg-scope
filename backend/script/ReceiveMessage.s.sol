// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/TargetMessenger.sol";

contract ReceiveMessage is Script {
    function run() external {
        vm.startBroadcast();
        TargetMessenger(0xd4e095Ca2381C0dA7af8FDcD947962c82E919F87)
            .receiveMessage(
                abi.encode("Hold your JETS We are going from Sepolia to Base !!")
            );


        vm.stopBroadcast();
    }
}