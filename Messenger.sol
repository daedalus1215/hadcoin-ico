pragma solidity ^0.4.24;

contract Messenger {
    address owner;
    string[] messages;

    constructor() public {
        owner = msg.sender;
    }

    function add(string newMessage) public {
        require(msg.sender == owner);
        messages.push(newMessage);
    }

    function count() view public returns(uint) {
        return messages.length;
    }

    function getMessage(uint index) view public returns(string) {
        return messages[index];
    }
} 