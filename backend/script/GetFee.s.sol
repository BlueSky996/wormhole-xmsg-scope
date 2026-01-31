// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/SourceMessenger.sol";

contract GetFee is Script {
    function run() external view {
        SourceMessenger source = SourceMessenger(0xd4e095Ca2381C0dA7af8FDcD947962c82E919F87);
        uint256 fee = source.getMinimumFee();
        console.log("minimum wormhole fee:", fee);
    }
}