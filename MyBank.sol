// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract MyBank{
    mapping (address=>uint) balanceLedger;
    address public admin;

    constructor(){
        admin= msg.sender;
    }
    
    modifier checkBalance(uint amt) {
        require(balanceLedger[msg.sender]>amt, "insuffient balance");
        _;//
    }

    function deposit() public payable {
        balanceLedger[msg.sender] = balanceLedger[msg.sender] + msg.value;
    }

    function getBalance() public view returns (uint){
        return balanceLedger[msg.sender];
    }

    function withdraw (uint amt) public checkBalance(amt) {
        //require(balanceLedger[msg.sender]>amt, "insuffient balance");

        balanceLedger[msg.sender]= balanceLedger[msg.sender] - amt;
        payable (msg.sender).transfer(amt);
    }

    function transfer(uint amt, address receiverAdd) public checkBalance(amt){
        //require(balanceLedger[msg.sender]>amt,"insuffient balance");

        balanceLedger[msg.sender]=balanceLedger[msg.sender]-amt;
        payable (receiverAdd).transfer(amt);
    }
}