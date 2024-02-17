// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MedicalRecord {
    
    struct Record {
        address hospital;
        uint encryptedData;
    }
    
    mapping(address => Record[]) private patientRecords;
    
    // Function to add a new medical record
    function addRecord(address patient, uint _encryptedData) public {
        require(_encryptedData != 0, "Invalid encrypted data");
        
        // Add record to patient's list of records
        Record memory newRecord = Record(patient, _encryptedData);
        patientRecords[patient].push(newRecord);
    }
    
    // Function to get the number of records for a patient
    function getNumberOfRecords(address _patient) public view returns(uint) {
        return patientRecords[_patient].length;
    }
    
    // Function to get a specific record for a patient
    function getRecord(address _patient, uint _index) public view returns(address, uint) {
        require(_index < patientRecords[_patient].length, "Index out of bounds");
        Record memory record = patientRecords[_patient][_index];
        return (record.hospital, record.encryptedData);
    }
}
