// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract MathFunction{
    uint8 num1;
    uint8 num2;
    uint8 num3;
    
    uint num;
    

    enum number_in_word {one,two,three,four,five}

    function getFindLargest() public view returns (uint8){
        if(num1>num2 && num1>num2){
            return num1;
        }
        else if (num1>num3 && num2>num3 ){
            return num2;
        }else {
            return num3;
        }
    } 

    function setNumbers(uint8 _num1, uint8 _num2, uint8 _num3) public {
        num1 = _num1;
        num2 =_num2;
        num3 = _num3;
    }

    function setNum(uint _num)public {
       num = _num;
    }

    function getSign() public view returns (string memory){
        if(num == 0){
            return "zero";
        }
        else if(num >= 0){
            return "positive";
        }
        else {
            return "negative";
        }
    }

    function getDigit() public view returns (string memory){
        
        if(num == 0){
            return "zero";
        }
        else if(num == 1){
            return "one";
        }
        else  if(num == 2){
            return "two";
        }
         else  if(num == 3){
            return "three";
        }
         else  if(num == 4){
            return "four";
        }
        else {
            return "Invalid input";
        }
    }

}