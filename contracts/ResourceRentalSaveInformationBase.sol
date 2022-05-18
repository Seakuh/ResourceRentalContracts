// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract ResourceRentalSaveInformationBase {
    // Resource Information
    Resource resource;

    // Booking Information
    Booking booking;

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
    }

    constructor(Resource memory resourse_, Booking memory booking_) public {
        resource = resourse_;
        booking = booking_;

        emit BookingCreated(
            booking.startBookingTime,
            booking.endBookingTime,
            booking.renter
        );
    }

    function getBookingInformation() public {}

    event BookingCreated(
        uint256 fromTimeStamp,
        uint256 toTimeStamp,
        address renterAddress
    );
}
