// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract Person{
    string name;
    uint age;

    function getPerson() public view virtual  returns (string memory, uint){
        return (name,age);
    }

    function setPerson(string memory _name,uint _age) public {
        name = _name;
        age = _age;
    }
}

contract Employee is Person {
    uint empId;

    function setEmpId(uint _empId, string memory _name, uint _age) public {
        setPerson(_name, _age);
        empId = _empId;
    }

    function getPerson() public view override  returns (string memory, uint){
        return (name,empId);

    }

}