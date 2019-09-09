pragma solidity ^0.4.8;

import './Ticket.sol';

contract Event {
	address   public owner;
	address[] public tickets;
	bytes32   public title;
	bytes32   public description;
	bytes32   public location;
	uint      public startDate;
	uint      public endDate;

	function Event(
		address _owner,
		bytes32 _title,
		bytes32 _description,
		bytes32 _location,
		uint _startDate,
		uint _endDate
	) {
		owner       = _owner;
		title       = _title;
		description = _description;
		location    = _location;
		startDate   = _startDate;
		endDate     = _endDate;
	}

	function printTicket( // gas
		bytes32 _external_id,
		bytes32 _seat,
		bytes32 _name
	) payable {
		tickets.push(new Ticket(owner, _external_id, _seat, _name));
	}

	function buyTicket(address _id) payable {
		Ticket ticket = Ticket(_id);
		if (ticket.owner() != owner) revert();
		if (msg.value < ticket.price()) revert();

		bool success = owner.send(msg.value);
		if (!success) revert();
	}

	function redeemTicket(address _id) {
		Ticket ticket = Ticket(_id);
		if (ticket.owner() != owner) revert();
		ticket.redeem();
	}
}
