// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract MyBook{
    string public title; //state variables
    uint16 public  price;
    address public  owner;
    bool public  sold;
    

    function getBookDetails() public view returns (string memory,uint16){
        return (title,price);
    }

    function setBook(string memory _title, uint16 _price) public  {
        title = _title;
        price = _price;
        owner = msg.sender;
        sold = false;
    }

    

    function ethTowei(uint eval) public pure returns (uint){
        return (eval*1000000000000000000);
    }

    function buyBook() public  payable {
        if(msg.value >= ethTowei(price)){
            uint bal = msg.value -ethTowei(price);
            payable (owner).transfer(msg.value);
            if(bal>0)
                payable (msg.sender).transfer(bal);
            
            owner = msg.sender;
            sold = true;
        }
        else {
            payable (msg.sender).transfer(msg.value);
        }    
    }
}

//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4