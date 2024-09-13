// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

contract EventManager {

    address owner;

    error AddressZeroDetected();
    error NotOwner();

    event EventCompleted(address eventAddress);

    constructor() {
        owner = msg.sender;
    }

    struct EventRequest {
        address sender;
        string eventName;
        uint256 eventTime;
        bool approved;
        bool completed;
    }

    mapping (address => EventRequest) ledger;

    function createEvent(string memory _eventName) external {

        if(msg.sender == address(0)) {
            revert AddressZeroDetected();
        }

    }

    function updateEvent(address _event) external {
        if(msg.sender != owner) {
            revert NotOwner();
        }

        EventRequest storage eventRequest = ledger[_event];
        eventRequest.completed = true;

    } 

}