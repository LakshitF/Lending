var CampaignFactory = artifacts.require("./CampaignFactory.sol");
var Campaign = artifacts.require("./Campaign.sol");
module.exports = function(deployer) {
  
  deployer.deploy(CampaignFactory); 
  //this is  useful for singleton contracts, only one instance of contract exists in the app.
  //it will allow us to create multiple campaigs.
  // deployer.deploy(Campaign); //deploy this contract from the campaign factory itself.
};
