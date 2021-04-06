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
        require((acc.amount += _addMoney) > acc.amount, "Overflow Error");
    }
    
    function withdraw(uint _removeMoney) public {
        require((acc.amount -= _removeMoney) < acc.amount, "Insufficient Funds or Overflow Error");
    }
    
    function deductToSecondAccount(uint _deductMoney) public {
        
        require((acc.amount -= _deductMoney) < acc.amount, "Overflow Error");
        assert((anotherAccount.amount += _deductMoney) > anotherAccount.amount);
    }
}