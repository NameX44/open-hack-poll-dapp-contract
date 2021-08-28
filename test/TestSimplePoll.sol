pragma solidity >=0.4.25 <0.9.0;
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Poll.sol";

contract TestSimplePoll {

  function testInit() public {
    SimplePoll simplePoll = SimplePoll(DeployedAddresses.SimplePoll());

    Assert.equal(uint(simplePoll.pollCount()), uint(1), "Should have one poll here");
  }

  function testCreation() public {
    SimplePoll simplePoll = SimplePoll(DeployedAddresses.SimplePoll());
    simplePoll.createPoll("Is this from test ?");
    Assert.equal(uint(simplePoll.pollCount()), uint(2), "Should have one poll here");
  }
}
