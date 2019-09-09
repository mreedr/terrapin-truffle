pragma solidity ^0.4.8;

import './ConvertLib.sol';
import './Event.sol';

/*struct Ticket {
	address owner;
	uint id; // internal id
	bytes32 external_id; // can be used to import arbitary ticketOwners
	bytes32 name; // name: (GA, Early Bird, RSVP)
	bytes32 seat;
	uint price;
	bool redeemed;
}*/

/*// should be library function
function remove(uint index) returns(uint[]) {
	if (index >= array.length) return;

	for (uint i = index; i<array.length-1; i++){
			array[i] = array[i+1];
	}
	delete array[array.length-1];
	array.length--;
	return array;
}*/

/*

	Current Issues:
		- Ensure all transactional functions are called from the master contract
*/

contract EventManager {
	event EventCreated();

	address public owner;
	address[] public events;

  function EventManager() {
    owner = msg.sender;
  }

	function getEvents() constant returns (address[]) {
		return events;
	}

  function createEvent(
		bytes32 _title,
		bytes32 _description,
		bytes32 _location,
		uint _startDate,
		uint _endDate
	) {
		events.push(
			new Event(
				msg.sender,
				_title,
				_description,
				_location,
				_startDate,
				_endDate
			)
		);
		EventCreated();
  }
}
