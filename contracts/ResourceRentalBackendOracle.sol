pragma solidity >=0.5.0 <0.6.0;

contract ResourceRentalBackendOracle {
    event NewResourceBooking(
        uint256 bookingId,
        uint256 resourceId,
        uint256 startTimestamp,
        uint256 endTimestamp
    );

    struct Booking {
        uint256 bookingId;
        uint256 resourceId;
        uint256 startTimestamp;
        uint256 endTimestamp;
    }

    address backendAddress;
    uint256 bookingCount = 0;
    Booking[] public Bookings;

    constructor() public {
        backendAddress = msg.sender;
    }

    function createResourceBooking(
        uint256 _resourceId,
        uint256 _startTimestamp,
        uint256 _endTimestamp
    ) public {
        i
        bookingCount++;
        uint256 id = Bookings.push(
            Booking(bookingCount, _resourceId, _startTimestamp, _endTimestamp)
        );
        emit NewResourceBooking(
            id,
            _resourceId,
            _startTimestamp,
            _endTimestamp
        );
    }

    modifier isBackend() {
        if (msg.sender == backendAddress) _;
    }
}
