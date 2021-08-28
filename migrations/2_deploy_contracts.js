const SimplePoll = artifacts.require("SimplePoll");

module.exports = function(deployer) {
  deployer.deploy(SimplePoll);
};
