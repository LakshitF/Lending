var CampaignFactory = artifacts.require("./CampaignFactory.sol");
var Campaign = artifacts.require("./Campaign.sol");

module.exports = function(deployer) {
  deployer.deploy(CampaignFactory);
  deployer.deploy(Campaign);
};
