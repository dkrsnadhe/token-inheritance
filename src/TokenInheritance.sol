// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Ownable {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}

contract Pausable is Ownable {
    bool public paused;

    modifier whenNotPaused() {
        require(!paused, "Contract paused!");
        _;
    }

    function pause() external onlyOwner {
        paused = true;
    }

    function unpause() external onlyOwner {
        paused = false;
    }
}

contract Token is Pausable {
    mapping(address => uint256) public balances;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function mint() external onlyOwner {
        balances[msg.sender] += 1000;
    }

    function transfer(address to, uint256 value) external whenNotPaused {
        require(balances[msg.sender] >= value, "Insufficient balance");

        balances[msg.sender] -= value;
        balances[to] += value;

        emit Transfer(msg.sender, to, value);
    }
}
