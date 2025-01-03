//this is a comment, this is where our code goes;

pragma solidity >=0.7.0 <0.9.0;

//Task
//1. Receive information
//2. store information
//3. return the informtion back

//variable types and example in solidity
    // uint256 storeData = 1;
    // string name = "tom";
    // bool switchOn = true;
//function
    // function functionName(){}


//a simple storage contract
contract simpleStorage {
    // write all the code inside here - functions and its state
    ///this is the state
    uint storeData;
   //a function to set  data
   function set(uint x) public {
    //create a storage contract that sets and gets values - only the values it reurns is multiplied 5x
        storeData = x*5;
   }
   // a function to get data
   function get() public view returns(uint)  {
        return storeData;
   }

   
   //create a storage contract that sets and gets values of NAMES
}
