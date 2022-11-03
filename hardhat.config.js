require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();

console.log("process.env.API_KEY_ETHERSCAN", process.env.API_KEY_ETHERSCAN);

module.exports = {
  solidity: "0.8.0",
  etherscan: {
    apiKey: process.env.API_KEY_ETHERSCAN,
  },
  networks: {
    goerli: {
      url: "https://goerli.infura.io/v3/",
      accounts: [process.env.PRIVATE_KEY],
    },
  },
};
