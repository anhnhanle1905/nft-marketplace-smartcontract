async function main() {
  const Marketplace = await ethers.getContractFactory(
    "contracts/NNGToken.sol:NNGToken"
  );

  // Start deployment, returning a promise that resolves to a contract object
  const marketplace = await Marketplace.deploy();
  await marketplace.deployed();
  console.log(
    ` Contract deployed to address: ${marketplace.address} \n--> Check address: https://goerli.etherscan.io/address/${marketplace.address}`
  );

  console.log(`Verifying contract on Etherscan...`);

  await run(`verify:verify`, {
    address: marketplace.address,
    constructorArguments: [],
  });
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
