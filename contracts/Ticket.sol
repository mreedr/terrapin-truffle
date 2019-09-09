pragma solidity ^0.4.8;

contract Ticket {
	address public owner;
	uint    public price = 0;
	bool    public redeemed = false;
	bytes32 public external_id;
	bytes32 public seat;
	bytes32 public name;

	address public buyee = 0x00;

	function Ticket(
		address _owner,
		bytes32 _external_id,
		bytes32 _seat,
		bytes32 _name
	) {
		owner = _owner;
		external_id = _external_id;
		seat = _seat;
		name = _name;
	}

	function setBuyee(address _sellee) {
		if (msg.sender != owner) revert();
		buyee = _sellee;
	}

	function redeem() {
		if (msg.sender != owner) revert();
		redeemed = true;
	}
}
