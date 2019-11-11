import web3 from './web3';
import CampaignFactory from '../build/contracts/CampaignFactory.json';

const instance = new web3.eth.Contract(
  JSON.parse(CampaignFactory.interface || {}),
  '0xfC57b9c20c31537cE4326091B5e7b9ca14F9012C'
);

export default instance;
