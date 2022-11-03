require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();

module.exports = {
  solidity: "0.8.8",
  etherscan: {
    apiKey: process.env.API_KEY_ETHERSCAN,
  },
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${process.env.API_KEY_ALCHEMY}`,
      accounts: [`${process.env.PRIVATE_KEY}`],
    },
  },
};
