import web3 from './web3';
import CampaignFactory from './build/CampaignFactory.json';

const instance = new web3.eth.Contract(
  JSON.parse(CampaignFactory.interface),
  '0x183c5D3FeE5a39bF864d71597B316ee561A133dF'
);

export default instance;
