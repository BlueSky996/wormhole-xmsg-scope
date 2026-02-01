// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IWormhole {
    function publishMessage(
        uint32 nonce,
        bytes memory payload,
        uint8 consistencyLevel
    ) external payable returns (uint64 sequence);

    function messageFee() external view returns (uint256);


    struct VM {
        uint32 timestamp;
        uint32 nonce;
        uint16 emitterChainId;
        bytes32 emitterAddress;
        uint64 sequence;
        uint8 consistencyLevel;
        bytes payload;
    }

    function parseAndVerifyVm(bytes calldata encodedVm) external view 
    returns ( VM memory vm, bool valid, string memory reason);
    
}