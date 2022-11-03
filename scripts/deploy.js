const hre = require("hardhat");

async function main() {
  const Marketpalce = await hre.ethers.getContractFactory("TokenTransfer");

  const marketpalce = await Marketpalce.deploy();

  console.log("NFT Marketpalce contract address: ", marketpalce.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
