require("@nomicfoundation/hardhat-toolbox");
require('@openzeppelin/hardhat-upgrades');
require("@nomiclabs/hardhat-waffle")
require("@nomiclabs/hardhat-etherscan")
require("hardhat-deploy")
require("solidity-coverage")
require("hardhat-gas-reporter")
require("hardhat-contract-sizer")
require("dotenv").config()

/** @type import('hardhat/config').HardhatUserConfig */


const COINMARKET_API_KEY = process.env.COINMARKET_API_KEY || "key"
const MAINNET_RPC_URL = process.env.MAINNET_RPC_URL || "key"
const MUMBAI_RPC_URL = process.env.MUMBAI_RPC_URL || "key"
const POLYSCAN_API_KEY = process.env.POLYSCAN_API_KEY || "key"

module.exports = {
    solidity: {
        compilers: [{ version: "0.8.18" }],
    },
    defaultNetwork: "hardhat",
    networks: {
        hardhat: {
            chainId: 80001,
            // forking: {
            //     url: MAINNET_RPC_URL,
            // },
        },
        localhost: {
            chainId: 31337,
        },
        mumbai: {
            url: MUMBAI_RPC_URL,
            accounts: [PRIVATE_KEY],
            chainId: 80001,
            blockConfirmations: 1,
        },
        mainnet: {
            url: MAINNET_RPC_URL,
            accounts: [PRIVATE_KEY],
            chainId: 1,
            blockConfirmations: 1,
        },
    },

    namedAccounts: {
        deployer: {
            default: 0,
        },
        user: {
            default: 1,
        },
    },

    mocha: {
        timeout: 300000, // 300 sec max
    },

    etherscan: {
        apiKey: POLYSCAN_API_KEY,
    },
    // polyscan: {
    //     apiKey: POLYSCAN_API_KEY,
    // },
}


