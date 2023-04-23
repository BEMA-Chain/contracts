const { ethers } = require("hardhat");
const fs = require("fs");
const bemaTokenSource = require("./path/to/BEMA.sol");

async function deployContracts(options) {
  const {
    bemaToken: bemaTokenName = "BemaToken",
    stakingPool: stakingPoolName = "StakingPool",
    distribution: distributionName = "Distribution",
    bemaMusic: bemaMusicName = "BemaMusic",
    bemaSale: bemaSaleName = "BemaSale"
  } = options;

  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  // Deploy BemaToken contract
  const BemaToken = await ethers.getContractFactory(bemaTokenSource.abi, bemaTokenSource.bytecode);
  const bemaToken = await BemaToken.deploy();
  console.log(`${bemaTokenName} contract deployed to:`, bemaToken.address);
  fs.writeFileSync(`${bemaTokenName.toLowerCase()}_abi.json`, JSON.stringify(BemaToken.interface.abi, null, 2));

  // Call the mint function of BemaToken contract to mint 100 tokens
  await bemaToken.mint(deployer.address, ethers.utils.parseEther("100"));

  // Deploy StakingPool contract
  const StakingPool = await ethers.getContractFactory(stakingPoolName);
  const stakingPool = await StakingPool.deploy(bemaToken.address);
  console.log(`${stakingPoolName} contract deployed to:`, stakingPool.address);
  fs.writeFileSync(`${stakingPoolName.toLowerCase()}_abi.json`, JSON.stringify(StakingPool.interface.abi, null, 2));

  // Deploy BemaMusic contract
  const BemaMusic = await ethers.getContractFactory(bemaMusicName);
  const bemaMusic = await BemaMusic.deploy();
  console.log(`${bemaMusicName} contract deployed to:`, bemaMusic.address);
  fs.writeFileSync(`${bemaMusicName.toLowerCase()}_abi.json`, JSON.stringify(BemaMusic.interface.abi, null, 2));

  // Deploy BemaSale contract
  const BemaSale = await ethers.getContractFactory(bemaSaleName);
  const bemaSale = await BemaSale.deploy(bemaMusic.address);
  console.log(`${bemaSaleName} contract deployed to:`, bemaSale.address);
  fs.writeFileSync(`${bemaSaleName.toLowerCase()}_abi.json`, JSON.stringify(BemaSale.interface.abi, null, 2));

  // Deploy Distribution contract
  const Distribution = await ethers.getContractFactory(distributionName);
  const distribution = await Distribution.deploy(
    bemaToken.address,
    stakingPool.address,
    bemaMusic.address,
    bemaSale.address
  );
  console.log(`${distributionName} contract deployed to:`, distribution.address);
  fs.writeFileSync(`${distributionName.toLowerCase()}_abi.json`, JSON.stringify(Distribution.interface.abi, null, 2));
}

// If script is being run directly, deploy the contracts
if (require.main === module) {
  deployContracts({})
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
}

// Export the deployContracts function so it can be imported and reused in other scripts
module.exports = deployContracts;
