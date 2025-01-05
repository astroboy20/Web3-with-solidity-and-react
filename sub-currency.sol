pragma solidity >=0.7.0 <0.9.0;
// SPDX-License-Identifier: MIT
contract Coin {
    address public minter;
    mapping(address => uint) public balances;

    //Event allow slints to react to specific
    //contract changes you declare
    /*Events is an inheritable member of a contract. as event is emitted it stores the arguements passed in trasaction logs
    These logs are stored and are accessible using addresss of the contract till the contract is present on the blockchain.
    */ 
    event Sent(address from, address to, uint amount);

    constructor(){
        minter = msg.sender;
    }

    //make new coins and send them to an address
    //only the owner can send the coins
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    //send any amount of coins
    //to an existing address

    //error for insufficient balance
    error insufficientBalance(uint requested, uint available);

    function send (address receiver, uint amount) public{
        // require(amount < balances[msg.sender]);
        if(amount > balances[msg.sender])
        revert insufficientBalance({
            requested: amount,
            available: balances[msg.sender]
        });
        balances[msg.sender] -= amount;
        balances[receiver] += amount;

        emit Sent(msg.sender, receiver, amount);
    }


}