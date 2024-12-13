// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Auction {
    
    address Admin;
    address public owner;
    string house;
    uint256 basePrice;

    constructor() {
        Admin = msg.sender;
    }

    modifier verify(){
        require(msg.sender == Admin,"unautherized");
        _;
    }

    function setAuction(string memory _house,uint256 _basePrice) public verify{
            house = _house;
            basePrice = _basePrice;
            owner = msg.sender;
    }
    function displayAuction() public view returns(string memory,uint256){
        return (house,basePrice);
    }
    function auctionCall(uint256 amount) public payable  {
        if(amount >=basePrice){
            basePrice = amount;
            owner = msg.sender;
        }else{
            payable (msg.sender).transfer(amount);
        }
    }




}