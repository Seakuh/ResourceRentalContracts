// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ResourceRentalUniversity {
    // Config Variables
    uint256 maxRooms;
    uint256 maxAmountSmartContracts;
    uint256 maxRentTime;
    uint256 offsetBookingTime;
    Permission resourcePermission;

    // Resource Information

    // University Intern
    address public university;
    uint256 authoritiesCount = 0;
    mapping(address => address[]) public authorities;
    Resource[] resources;

    // uint256 fromTimestamp;
    // uint256 toTimestamp;

    struct Resource {
        uint256 resourceId;
        string resourceName;
        bool loanable;
        uint256 loanInterval;
        uint256 resourceElectricityCostPerHour;
        uint256 resourceCosts;
        uint256 computingPower;
        bool buyOut;
        uint256 appraisedValue;
    }
    struct Authority {
        Permission permission;
    }

    enum Permission {
        STUDENT,
        SCIENTIFIC_ASSISTANT,
        PROFESSOR
    }

    //constructor
    constructor() public {
        university = msg.sender;
    }

    function insertBooking() public isAuthority {}

    function setMaxRooms(uint256 _maxRooms) public isAuthority {
        maxRooms = _maxRooms;
    }

    function addAuthority(address _newAuthorityAddress) public isUniversity {
        authorities[_newAuthorityAddress].push(_newAuthorityAddress);
    }

    function addStudent(address _newAuthorityAddress) public isUniversity {
        authorities[_newAuthorityAddress].push(_newAuthorityAddress);
    }

    function addProfessor(address _newAuthorityAddress) public isUniversity {
        authorities[_newAuthorityAddress].push(_newAuthorityAddress);
    }

    function removeAuthority(address _removeAuthorityAddress)
        public
        isUniversity
    {
        delete authorities[_removeAuthorityAddress];
    }

    function changeMaxRoomAmount(uint256 _maxRooms) public isAuthority {
        maxRooms = _maxRooms;
    }

    function changeMaxRentTime(uint256 _maxRentTime) public isAuthority {}

    function createBooking(
        uint256 fromTimeStampInput,
        uint256 toTimeStampInput,
        address renterAddress,
        Permission renterPermission
    ) public {
        require(
            block.timestamp < (offsetBookingTime + uint256(fromTimeStampInput)),
            "The rental must be in future"
        );

        require(
            (renterPermission >= resourcePermission),
            "The User is allowed to book the room"
        );

        require(
            (fromTimeStampInput + toTimeStampInput <= maxRentTime),
            "The booking time is above the maxRentTime"
        );

        emit BookingCreated(
            fromTimeStampInput,
            toTimeStampInput,
            renterAddress,
            renterPermission
        );
    }

    // Functionen

    function getUniversity() public view returns (address) {
        return university;
    }

    function getResourceRequiredPermission() public view returns (Permission) {}

    // Modifier

    modifier isUniversity() {
        require(msg.sender == university, "Caller is not owner");
        _;
    }

    modifier isAuthority() {
        require(msg.sender == university, "Caller is not owner");
        _;
    }
    // Events

    event BookingCreated(
        uint256 fromTimeStamp,
        uint256 toTimeStamp,
        address renterAddress,
        Permission renterPermission
    );
}
