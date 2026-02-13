// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title TokenGate Contract
/// @notice Access control based on token ownership.
contract TokenGate {

    mapping(address => bool) public admins;
    mapping(address => uint256) public requiredBalance; // token address -> min balance
    
    constructor() {
        admins[msg.sender] = true;
    }
    
    function setRequirement(address _token, uint256 _amount) external {
        require(admins[msg.sender], "Not admin");
        requiredBalance[_token] = _amount;
    }
    
    // Check function would be called off-chain or via logic
    function checkAccess(address _user, address _token) external view returns (bool) {
        // Need interface for ERC20 balance check
        // For simplicity, returning false as placeholder
        return false; 
    }

}
