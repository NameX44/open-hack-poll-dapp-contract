// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;

contract SimplePoll {
    struct Poll {
       uint id;
       string question;
       address creator;
       mapping (address => bool) votes; 
    }
    uint public pollCount = 0;
    mapping(uint => Poll) public polls;

    event PollCreated(uint indexed id, address indexed creator);

    constructor() public {
        createPoll("Is this project working ?");
    }

    function createPoll(string memory question) payable public returns(uint pollID) {
      pollID = pollCount++;
      Poll storage poll = polls[pollID];
      poll.question = question;
      emit PollCreated(pollID, msg.sender);
      return pollID;
    }
}