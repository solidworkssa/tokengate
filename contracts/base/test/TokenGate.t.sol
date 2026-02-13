// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/TokenGate.sol";

contract TokenGateTest is Test {
    TokenGate public c;
    
    function setUp() public {
        c = new TokenGate();
    }

    function testDeployment() public {
        assertTrue(address(c) != address(0));
    }
}
