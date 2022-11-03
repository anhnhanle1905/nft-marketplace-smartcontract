async function main() {
  const Marketplace = await ethers.getContractFactory(
    "contracts/Marketplace.sol:Marketplace"
  );

  // Start deployment, returning a promise that resolves to a contract object
  const marketplace = await Marketplace.deploy();
  await marketplace.deployed();
  console.log(
    ` Contract deployed to address: ${marketplace.address} \n--> Check address: https://goerli.etherscan.io/address/${marketplace.address}`
  );
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
