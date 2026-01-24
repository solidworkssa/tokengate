// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AccessControl {
    struct Access {
        bool granted;
        uint256 expiresAt;
        string credential;
    }

    mapping(address => Access) public accessList;
    address public admin;

    event AccessGranted(address indexed user, uint256 expiresAt, string credential);
    event AccessRevoked(address indexed user);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function grantAccess(address _user, uint256 _duration, string memory _credential) external onlyAdmin {
        uint256 expiresAt = block.timestamp + _duration;
        
        accessList[_user] = Access({
            granted: true,
            expiresAt: expiresAt,
            credential: _credential
        });

        emit AccessGranted(_user, expiresAt, _credential);
    }

    function revokeAccess(address _user) external onlyAdmin {
        delete accessList[_user];
        emit AccessRevoked(_user);
    }

    function hasAccess(address _user) external view returns (bool) {
        Access memory access = accessList[_user];
        return access.granted && block.timestamp < access.expiresAt;
    }

    function getAccess(address _user) external view returns (Access memory) {
        return accessList[_user];
    }
}
