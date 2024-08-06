import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

// Ensure your configuration variables are set before executing the script
const { vars } = require("hardhat/config");

// Add your Arbitrum account private key to the configuration variables
// To export your private key from Metamask, open Metamask and
// go to Account Details > Export Private Key
// Beware: NEVER put real Ether into testing accounts
const ARBITRUM_PRIVATE_KEY = vars.get("ARBITRUM_PRIVATE_KEY");
const ARBITRUM_RPC_URL = vars.get("ARBITRUM_RPC_URL")
const ARBITRUM_API_KEY = vars.get("ARBITRUM_API_KEY");

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  networks: {
    arbitrumSepolia: {
      url: ARBITRUM_RPC_URL,
      accounts: [ARBITRUM_PRIVATE_KEY],
    },
  },
  etherscan: {
    apiKey: {
      arbitrumSepolia: ARBITRUM_API_KEY,
    },
  },
  sourcify: {
    enabled: true
  }
};

export default config;
