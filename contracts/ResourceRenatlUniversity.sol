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
    mapping(address => address[]) public authorities;
    mapping(address => address[]) public resources;

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

    enum Permission {
        STUDENT,
        SCIENTIFIC_ASSISTANT,
        PROFESSOR
    }

    //constructor
    constructor() public {
        university = msg.sender;
    }

    function createResource() public {}

    function addAuthority(address newAuthority) public {}

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
