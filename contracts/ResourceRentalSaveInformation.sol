// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract ResourceRentalSaveInformation {
    // Resource Information
    Resource[] resource;

    // Booking Information
    Booking[] booking;

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

    struct Booking {
        uint256 startBookingTime;
        uint256 endBookingTime;
        address renter;
        Permission renterPermission;
    }

    enum Permission {
        STUDENT,
        SCIENTIFIC_ASSISTANT,
        PROFESSOR
    }

    constructor() public {}

    function createBooking() public {
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

    function getBookingInformation() public {}

    event BookingCreated(
        uint256 fromTimeStamp,
        uint256 toTimeStamp,
        address renterAddress,
        Permission renterPermission
    );
}
