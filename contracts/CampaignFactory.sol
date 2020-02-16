pragma solidity ^0.6.1;

import "./Campaign.sol";

contract CampaignFactory {
    address[] public deployedCampaigns;
    string desc = "first";
    function createCampaign(uint minimum,string memory desc2,uint val,address payable reci,uint last) public {
        Campaign newCampaign = new Campaign(minimum,desc2,val,reci,last);   //explicit conversion is required
        deployedCampaigns.push(address(newCampaign));
    }

    function getDeployedCampaigns() public view returns (address[] memory){
        return deployedCampaigns;
    }
}
