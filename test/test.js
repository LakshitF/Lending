creator = 0xC5d228828DE48dE1cab9c8FDC7DED61f902C6FED//address i am logged in on metamask while using the truffle console.

let a;letc;
CampaignFactory.deployed().then(inst=>{a=inst});    //now it will work.
CampaignFactory.at('0x3d3410425DC76b77aAb60DAf36b9D8b69ad7d085').then(inst=>{a=inst});  //this is the address from ganache cli
a.createCampaign(2,"first",10,'0x0394477019d01C83161D02Ccf81E6287592f50EA',1000000)
a.getDeployedCampaigns()
Campaign.at('0x74e4b9439A9531c3844d281E78EEB8F78CAd8499').then(inst=>{c=inst}); 
//NEW WAY
a.createCampaign(10,"hello from child",1000,'0x0394477019d01C83161D02Ccf81E6287592f50EA',1000,{from:'0xC5d228828DE48dE1cab9c8FDC7DED61f902C6FED'});
