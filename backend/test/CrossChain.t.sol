// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/SourceMessenger.sol";
import "../src/TargetMessenger.sol";

contract CrossChainTest is Test {
    SourceMessenger source;
    TargetMessenger target;

    function setUp() public {
        source = new SourceMessenger(address(0));
        target = new TargetMessenger(address(0));
    }

    function testSendRecieve() public {
        bytes memory payload = abi.encode("hello wormhole");

        // simulate sending message
        target.receiveMessage(payload);

        // check if it arrived
        bytes memory received = target.lastMessage();
        assertEq(received, payload, "message mismatch");
    }
}