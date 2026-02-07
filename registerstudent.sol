// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry {

    // 1. Data Structure: Defining what a 'Student' looks like
    struct Student {
        string name;
        uint256 rollNumber;
        address walletAddress;
    }

    // 2. State Variables: Storing the data
    // We use a mapping to link a wallet address directly to student details
    mapping(address => Student) public students;

    // 3. Events: To log when a student registers
    // 'indexed' allows external apps to filter logs by address
    event StudentRegistered(address indexed studentAddress, string name, uint256 rollNumber);

    // 4. Function: Register a student
    function registerStudent(string memory _name, uint256 _rollNumber) external {
        // Constraint: Name cannot be empty
        // In Solidity, we check string length by converting to bytes
        require(bytes(_name).length > 0, "Name cannot be empty");

        // Constraint: Roll number must be greater than 0
        require(_rollNumber > 0, "Roll number must be positive");

        // Constraint: One wallet address can only register once
        // We check if the walletAddress in the storage is strictly empty (address(0))
        require(students[msg.sender].walletAddress == address(0), "User already registered");

        // Update the state (Store the data)
        students[msg.sender] = Student({
            name: _name,
            rollNumber: _rollNumber,
            walletAddress: msg.sender
        });

        // Emit the event
        emit StudentRegistered(msg.sender, _name, _rollNumber);
    }

    // 5. Function: Retrieve student details
    function getStudent(address _studentAddress) external view returns (string memory, uint256, address) {
        // Optional: Check if the student actually exists before returning
        require(students[_studentAddress].walletAddress != address(0), "Student not registered");

        Student memory s = students[_studentAddress];
        return (s.name, s.rollNumber, s.walletAddress);
    }
}