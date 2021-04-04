pragma solidity ^0.4.24;

contract Mappings {
    address owner;
    mapping (address => uint256) public accounts;

    constructor(uint256 initialSupply) public {
        owner = msg.sender;
        accounts[owner] = initialSupply;
    }

    function transfer(address to, uint256 value) public {
        require(accounts[msg.sender] >= value); // check balance
        require(accounts[to] + value >= accounts[to]); // overflow check
        accounts[msg.sender] -= value;
        accounts[to] += value;
    }
    
    function getBalanceOfAccount(address account) view public returns(uint256) {
        return accounts[account];
    }
    
        function getRemainingTokens() view public returns(uint256) {
        return accounts[owner];
    }
    
    function deposit(uint money) public {
        accounts[msg.sender] += money;
    }
    
    function withdraw(uint money) public {
        accounts[msg.sender] -= money;
    }
}