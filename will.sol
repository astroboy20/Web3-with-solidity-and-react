pragma solidity >=0.7.0 <0.9.0;
// SPDX-License-Identifier: MIT

contract Will {
    address owner;
    uint    fortune;
    bool    deceased;

    constructor() payable  {
        owner = msg.sender;
        //sender represent address that is being called
        fortune = msg.value;
        //value shows the amount of ether being sent
        deceased = false;
    }

    //create modifier so the only person who can call the contract is the owner
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    //create modifier so that we only allocate funds if the friend's gramps is dead
    modifier  mustBeDeceased {
        require(deceased == true);
        _;
    }

    //list of family wallet addresses
    address payable [] familyWallets;

    //map through inheritance
    mapping(address => uint) inheritance;

    //set inheritance or each address
    function setInheritance (address payable wallet, uint amount) public{
        familyWallets.push(wallet);
        inheritance[wallet] = amount;
    }

    //pay based on wallet
    function payOut() mustBeDeceased private{
        for (uint i =0; i < familyWallets.length; i++){
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
        }
    }

    //oracle switch simulation
    function deseased() public onlyOwner {
        deceased = true;
        payOut();
    }
}