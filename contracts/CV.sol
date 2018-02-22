pragma solidity ^0.4.18;
import "zeppelin-solidity/contracts/ownership/Ownable.sol";

contract CV is Ownable {

        struct PersonalInfo {
            string name;
            string birth;
            string city;
            uint phone;
            string email;
            string photo;
        }
        PersonalInfo personalInfo;

        struct Job {
            string employer;
            string beginDate;
            string endDate;
            string duties;
        }
        mapping (uint => Job) workExperience;
        uint jobCounter = 0;

        struct School {
            string university;
            string beginDate;
            string endDate;
            string info;
        }
        mapping (uint => School) Education;
        uint schoolCounter = 0;
        
        string[] public certificates;
        
        struct ExtraInfo {
            string[] interests;
            string[] languages;
        }
        ExtraInfo extraInfo;

    function setPersonalInfo(string _name, string _birth, string _city, uint _phone, string _email, string _photo) onlyOwner() public {
        personalInfo.name = _name;
        personalInfo.birth = _birth;
        personalInfo.city = _city;
        personalInfo.phone = _phone;
        personalInfo.email = _email;
        personalInfo.photo = _photo;
    }

    function getPersonalInfo() view public returns (string, string, string, uint, string, string) {
        return (personalInfo.name, personalInfo.birth, personalInfo.city, personalInfo.phone, personalInfo.email, personalInfo.photo);
    }

    function setJob(string _employer, string _beginDate, string _endDate, string _duties) onlyOwner() public {
        var job = workExperience[jobCounter];

        job.employer = _employer;
        job.beginDate = _beginDate;
        job.endDate = _endDate;
        job.duties = _duties;

        jobCounter++;
    }

    function countJob() view public returns (uint) {
        return jobCounter;
    }

    function getJob(uint _job) view public returns (string, string, string, string) {
        return (workExperience[_job].employer, workExperience[_job].beginDate, workExperience[_job].endDate, workExperience[_job].duties);
    }

    function setSchool(string _university, string _beginDate, string _endDate, string _info) onlyOwner() public {
        var school = Education[schoolCounter];

        school.university = _university;
        school.beginDate = _beginDate;
        school.endDate = _endDate;
        school.info = _info;

        schoolCounter++;
    }

    function countSchool() view public returns (uint) {
        return schoolCounter;
    }

    function getSchool(uint _school) view public returns (string, string, string, string) {
        return (Education[_school].university, Education[_school].beginDate, Education[_school].endDate, Education[_school].info);
    }

    function setCert(string _certName) onlyOwner() public {
        certificates.push(_certName);
    }

    function getCert(uint _certNumber) view public returns (string) {
        return certificates[_certNumber];
    }

    function countCerts() view public returns (uint) {
        return certificates.length;
    }

    function setInterest(string _interest) onlyOwner() public {
        extraInfo.interests.push(_interest);
    }

    function getInterest(uint _interestNumber) view public returns (string) {
        return extraInfo.interests[_interestNumber];
    }
    function countInterests() view public returns (uint) {
        return extraInfo.interests.length;
    }

    function setLanguage(string _language) onlyOwner() public {
        extraInfo.languages.push(_language);
    }

    function getLanguage(uint _languageNumber) view public returns (string) {
        return extraInfo.languages[_languageNumber];
    }
    function countLanguages() view public returns (uint) {
        return extraInfo.languages.length;
    }

}