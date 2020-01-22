pragma solidity ^0.5.8;

import "./Campaign.sol";

contract CampaignFactory {
    address[] public deployedCampaigns;

    function createCampaign(uint minimum,string memory desc,uint val,address payable reci,uint last) public {
        Campaign newCampaign = new Campaign(minimum,desc,val,reci,last);   //explicit conversion is required
        deployedCampaigns.push( address(newCampaign) );
    }

    function getDeployedCampaigns() public view returns (address[] memory){
        return deployedCampaigns;
    }
}
