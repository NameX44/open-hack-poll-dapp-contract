const SimplePoll = artifacts.require("SimplePoll");

contract('SimplePoll', (alice, bob) => {
  it('should have 1 poll', async () => {
    const SimplePollInstance = await SimplePoll.deployed({from: alice});
    const pollCount = await SimplePollInstance.pollCount();

    assert.equal(pollCount, 1, "should have 1 poll");
  });
  it('should have 2 poll after create', async () => {
    const SimplePollInstance = await SimplePoll.deployed({from: alice});
    const result = await SimplePollInstance.createPoll("is This from test ?");

    const pollCount = await SimplePollInstance.pollCount();

    assert.equal(pollCount, 2, "should have 2 poll");
    const event = result.logs[0].args;
    assert.equal(event.id.toNumber(), 2);
    // console.log(event);
    // assert.equal(event.question, 'is This from test ?');
  });
});
