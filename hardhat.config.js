require("@nomicfoundation/hardhat-toolbox");

const { vars } = require("hardhat/config");

const ACCOUNT_PRIVATE_KEY = vars.get("ACCOUNT_PRIVATE_KEY");
const ETHER_SCAN_API_KEY = vars.get("ETHER_SCAN_API_KEY");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks:{
    sepolia:{
      url: `https://eth-sepolia.g.alchemy.com/v2/Se7S7XFoIIFJdfuQ6ReVlEBMLpsxCvGk`,
      accounts:[`${ACCOUNT_PRIVATE_KEY}`]
    }
  },
  etherscan: {
    apiKey: `${ETHER_SCAN_API_KEY}`
  }
};
