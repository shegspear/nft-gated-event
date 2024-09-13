// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract EventManager {

    address owner;

    error AddressZeroDetected();
    error NotEligible();
    error NotOwner();
    error AlreadyCreatedEvent();

    event EventCompleted(address eventAddress);
    event EventLogged();

    address myNFT = 0xa1200731B4Ae09e3DFeC1cEA7BFAEFB65F2e4E71; // not tested 

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

    function createEvent(string memory _eventName) external  {

        EventRequest storage _eventRequest = ledger[msg.sender];

        if(msg.sender == address(0)) {
            revert AddressZeroDetected();
        }

        if(_eventRequest.approved) {
            revert AlreadyCreatedEvent();
        }

        if(IERC721(myNFT).balanceOf(msg.sender) ==  0) {
            revert NotEligible();
        }

        ledger[msg.sender] = EventRequest(msg.sender, _eventName, block.timestamp, true, false);

        emit EventLogged();
    }

    // function acquire NFT  

    function updateEvent(address _event) external {

        if(msg.sender == address(0)) {
            revert AddressZeroDetected();
        }

        if(msg.sender != owner) {
            revert NotOwner();
        }

        EventRequest storage eventRequest = ledger[_event];
        eventRequest.completed = true;

        emit EventCompleted(eventRequest.sender);
    } 

}