// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ResourceRentalAdmin {
    // Config Variables
    uint256 maxRooms;
    uint256 maxAmountSmartContracts;
    uint256 maxRentTime;
    uint256 offsetBookingTime;

    address public admin;

    struct Booking {
        uint256 bookingId;
        uint256 resourceId;
        uint256 startTimestamp;
        uint256 endTimestamp;
    }

    enum Permission {
        STUDENT,
        SCIENTIFIC_ASSISTANT,
        PROFESSOR
    }

    //constructor
    constructor() public {
        admin = msg.sender;
    }

    function createBooking(
        uint256 renterAddress,
        uint256 resourceId,
        uint256 startTimestamp,
        uint256 endTimestamp
    ) public {
        require(msg.sender == admin);
    }

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

    function getAdmin() public view returns (address) {
        return admin;
    }

    function getResourceRequiredPermission() public view returns (Permission) {}

    // Modifier

    modifier isAdmin() {
        require(msg.sender == admin, "Caller is not owner");
        _;
    }

    modifier isAuthority() {
        require(msg.sender == admin, "Caller is not owner");
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
