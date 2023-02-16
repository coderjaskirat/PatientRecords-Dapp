//SPDX-License-Identifier: MIT
pragma solidity >0.8.0;



contract Hospital {
    struct AppointmentDetails{
        address patientId;
        address doctorId;
        string name;
        uint8 date;
        uint8 month;
        uint8 year;
        string symptoms;
        string medicine;
    }

    struct LabReport{
        address patientId;
        uint256 reportId;
        address doctorId;
        string name;
        uint8 date;
        uint8 month;
        uint8 year;
        string reportName;
        string reportVariables;
        string doctorRemarks;
        bool result;
    }

    AppointmentDetails[] public appointmentDetails;

    LabReport[] public labReport;

    mapping(address => string) public users;

    mapping(address => string) public doctors;

    function addUser(address _id, string memory _name) public {
        users[_id] = _name;
    }

    function addDoctor(address _id, string memory _name) public {
        doctors[_id] = _name;
    }

    function addAppointment(address _patientId, address _doctorId, string memory _name, uint8 _date, uint8 _month, uint8 _year, string memory _symptoms, string memory _medicine) public {
        appointmentDetails.push(AppointmentDetails({patientId: _patientId, doctorId: _doctorId, name: _name, date: _date, month: _month, year: _year, symptoms: _symptoms, medicine: _medicine}));
    }

    function addReport(address _patientId, address _doctorId, uint256 _reportId, string memory _name, uint8 _date, uint8 _month, uint8 _year, string memory _reportName, string memory _reportVariables, string memory _doctorRemarks, bool _result) public {
        labReport.push(LabReport({patientId: _patientId, doctorId: _doctorId, reportId: _reportId, name: _name, date: _date, month: _month, year: _year, reportName: _reportName, reportVariables: _reportVariables, doctorRemarks: _doctorRemarks, result: _result}));
    }

    function getPatients(address _doctorId) public view returns(address[] memory) {
        address[] memory patients;
        bool present = false;
        for(uint i=0; i<appointmentDetails.length; i++) {
            if(appointmentDetails[i].doctorId == _doctorId) {
                for(uint j=0; j<patients.length; j++) {
                    if(patients[j] == appointmentDetails[i].patientId){
                        present = true;
                        break;
                    }
                }
                if(!present) {
                    patients[i] = appointmentDetails[i].patientId;
                }
            }
        }
        return patients;
    }

    function getDoctors(address _patientId) public view returns(address[] memory) {
        address[] memory pDoctors;
        bool present = false;
        for(uint i=0; i<appointmentDetails.length; i++) {
            if(appointmentDetails[i].patientId == _patientId) {
                for(uint j=0; j<pDoctors.length; j++) {
                    if(pDoctors[j] == appointmentDetails[i].doctorId){
                        present = true;
                        break;
                    }
                }
                if(!present) {
                    pDoctors[i] = appointmentDetails[i].doctorId;
                }
            }
        }
        return pDoctors;
    }

    function getPatientsAppointments(uint256 _doctorId) public view returns(string[] memory) {
        
    }

}