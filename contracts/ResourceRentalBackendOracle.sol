pragma solidity >=0.5.0 <0.6.0;

contract ResourceRentalBackendOracle {
    struct Booking {
        uint256 bookingId;
        uint256 resourceId;
        uint256 startTimestamp;
        uint256 endTimestamp;
    }

    address backendAddress;
    uint256 bookingCount = 0;

    constructor() public {
        backendAddress = msg.sender;
    }

    function createResourceBooking(
        uint256 _resourceId,
        uint256 _startTimestamp,
        uint256 _endTimestamp
    ) public isBackend {
        emit NewResourceBooking(
            bookingCount++,
            _resourceId,
            _startTimestamp,
            _endTimestamp
        );
    }

    modifier isBackend() {
        if (msg.sender == backendAddress) _;
    }

    event NewResourceBooking(
        uint256 bookingId,
        uint256 resourceId,
        uint256 startTimestamp,
        uint256 endTimestamp
    );
}
