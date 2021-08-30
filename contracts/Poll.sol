// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;

contract SimplePoll {
    struct Poll {
       uint id;
       uint creationTime;
       string question;
       address creator;
       mapping (address => bool) votes; 
    }
    uint public pollCount = 0;
    mapping(uint => Poll) public polls;

    event PollCreated(uint indexed id, address indexed creator);

    constructor() public {
        createPoll("First pool, does the project looks good ?");
    }

    function createPoll(string memory question) payable public returns(uint pollID) {
      uint pollIndex = pollCount;
      pollCount++;
      pollID = pollCount;
      Poll storage poll = polls[pollIndex];
      poll.id = pollID;
      poll.question = question;
      poll.creator = msg.sender;
      poll.creationTime = block.timestamp;
      emit PollCreated(pollID, msg.sender);
      return pollID;
    }
}