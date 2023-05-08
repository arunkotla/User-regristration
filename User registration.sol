// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Register {

    struct User {
        string name;
        string email;
        bool isRegistered;
    }

    mapping(address => User) internal users;
    mapping (string => address) internal verification;

    function register_here(string memory _name, string memory _email) public {
        
        require(!users[msg.sender].isRegistered, "You have already registered");
        require(verification[_email] == address(0), "email is already in use");

        users[msg.sender] = User(_name, _email, true);
        verification[_email] = msg.sender;
    }

    function authentication_check (string memory _email) public view returns(bool){
    if (verification[_email] == msg.sender) {
        return true;}
        return false;
    }
}