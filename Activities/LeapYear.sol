// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract LeapYear{
    uint year;
    int count =0;

    function setYear(uint _year) public {
        year = _year;
    }
    
    // function getCountDigit() public view returns (uint) {
        
    //     while(year!=0){
    //         year=year/10;
    //         count ++;
    //     }
    //     return count;
    // }

    function getLeapYear() public view returns (string memory) {
       
        if ((year % 4 == 0 && year % 100 == 0) || (year % 400 == 0)) {
            return "Leap Year";
        } else {
            return "Not a Leap Year";
        }
    }
}