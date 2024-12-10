// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract Employee{
    struct Employe{
        string name;
        string department;
        string designation;
        uint16 salary;
        address wallet;
    }
    
    Employe public employe;

    function setEmployeeDetails(string memory _name, string memory _depatment, string memory _designation, uint16 _salary) public {
        employe.name = _name;
        employe.department = _depatment;
        employe.designation = _designation;
        employe.salary = _salary;
        employe.wallet = msg.sender;
    }

    function getEmplyeeDetails() public view returns (string memory, string memory,string memory, uint16){
        return (employe.name,employe.department,employe.designation,employe.salary);
    }

    function payEmployee() public  payable {
        if(msg.value > employe.salary){
            payable (employe.wallet).transfer(employe.salary);
        }
    }
}