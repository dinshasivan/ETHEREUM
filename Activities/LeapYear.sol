// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract LeapYear{
    uint year;

    function lapYear(uint _year) public pure returns (string memory) {
        uint count = 0;
        uint tempYear = _year;
        while (tempYear != 0) {
            tempYear /= 10;
            count++;
        }

        require(count==4,"check inputs");
        if ((_year % 4 == 0 && _year % 100 == 0) || (_year % 400 == 0)) {
            return "Leap Year";
        } else {
            return "Not a Leap Year";
        }
       
    }
}