pragma solidity ^0.4.24;

contract Bank {
    struct Account {
        address addr;
        uint amount;
    }

    Account public acc = Account({
        addr: 0x66ec652455a86,
        amount:50
    });
    
    Account public anotherAccount = Account({
        addr: 0x6686867f389357,
        amount: 50
    });

    function addAmount(uint _addMoney) public {
        acc.amount += _addMoney;
    }
    
    function withdraw(uint _removeMoney) public {
        acc.amount -= _removeMoney;
    }
    
    function deductToSecondAccount(uint _deductMoney) public {
        acc.amount -= _deductMoney;
        anotherAccount.amount += _deductMoney;
    }
}