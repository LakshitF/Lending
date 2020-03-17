const mnemonic = "unusual replace window denial vendor awesome spoon explain regret strike piano north";

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    // ropsten: {
    //   provider: function() {
    //     return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/6ae6ad05c98340a19a08a75b90536c96");
    //   },
    //   network_id: '3',
    // },
    development: {
      host: "127.0.0.1",
      port: 7545,
      networkCheckTimeout: 10000000,
      network_id: "*" // Match any network id
    },
    develop: {
      port: 7545,
      networkCheckTimeout: 10000000
    }
  }
};
