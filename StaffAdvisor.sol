// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract StaffAdvisor{

    struct Student{
        string name;
        uint rollNo;
        uint sem;
        string dept;
        uint cgpa;
    }    
    address public staffadvisor;

    mapping (uint=>Student) public student;

    uint studentCount =0;

    constructor (){
        staffadvisor = msg.sender;
    }

    modifier checkStaffAdvisor(){
        require(msg.sender==staffadvisor);
        _;
    }


    function setStudentDetails(string memory _name,uint _rollNo, string memory _dept, uint _sem, uint _cgpa) checkStaffAdvisor() public {
        student[_rollNo].rollNo = _rollNo;
        student[_rollNo].name = _name;
        student[_rollNo].sem = _sem;
        student[_rollNo].dept = _dept;
        student[_rollNo].cgpa = _cgpa;

        studentCount+=1;
        
    } 

    function getStudentDetails(uint _rollNo) public view virtual  returns (uint,string memory,uint,string memory, uint){
        
        return (student[_rollNo].rollNo,student[_rollNo].name,student[_rollNo].sem,student[_rollNo].dept,student[_rollNo].cgpa);
    }

    function setNewname(uint _rollNo, string memory _newName) public {
        student[_rollNo].rollNo = _rollNo;
        student[_rollNo].name = _newName;
    }
}




