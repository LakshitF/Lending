//ALL WORKING NOW
CampaignFactory.at('0x3d3410425DC76b77aAb60DAf36b9D8b69ad7d085').then(inst=>{a=inst});  //this is the address from ganache cli

//NEW WAY
//this address guy is the person who is recipient
a.createCampaign(10,"hello from child",10000000,'0x204f560Df9C31e409E7F38E738eeF86A48FD1Bf5',1000,{from:'0x204f560Df9C31e409E7F38E738eeF86A48FD1Bf5'});

Campaign.at('0x10E0035Ce249d99ad87C2D5ec140A7673927fe87').then(inst=>{c=inst}); 

USe to access public variables:
c.value()
c.value().then(num=>{let temp = num.toNumber(); console.log(temp);})    //to convert to number

//Now make an investor who invests in this.
0xCb0fEa7A27364c76A69b98007FfF1D56305F295F wants to contribute 400 wei
c.contribute({from:'0xCb0fEa7A27364c76A69b98007FfF1D56305F295F',value:4000000}).then(err=>console.log(err));
//this sends ether from the address to the contract.