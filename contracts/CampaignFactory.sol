pragma solidity ^0.5.8;

import "./Campaign.sol";

contract CampaignFactory {
    address[] public deployedCampaigns;

    function createCampaign(uint minimum) public {
        address newCampaign = address(new Campaign(minimum, msg.sender));   //explicit conversion is required
        deployedCampaigns.push(newCampaign);
    }

    function getDeployedCampaigns() public view returns (address[] memory){
        return deployedCampaigns;
    }
}
