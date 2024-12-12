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

    modifier studentExist(uint _rollNo){
        require((student[_rollNo].rollNo == _rollNo), "Student not present");
        _;
    }

    function totalStudents() public view returns(uint) {
        return (studentCount); 
    }

    function setStudentDetails(string memory _name,uint _rollNo, string memory _dept, uint _sem, uint _cgpa) checkStaffAdvisor() public {
        student[_rollNo].rollNo = _rollNo;
        student[_rollNo].name = _name;
        student[_rollNo].sem = _sem;
        student[_rollNo].dept = _dept;
        student[_rollNo].cgpa = _cgpa;

        studentCount+=1;
        
    } 

    function getStudentDetails(uint _rollNo) public view studentExist(_rollNo) returns (uint,string memory,uint,string memory, uint){
        
        return (student[_rollNo].rollNo,student[_rollNo].name,student[_rollNo].sem,student[_rollNo].dept,student[_rollNo].cgpa);
    }

    function setNewname(uint _rollNo, string memory _newName) studentExist(_rollNo) public {
        student[_rollNo].rollNo = _rollNo;
        student[_rollNo].name = _newName;
    } 
}




