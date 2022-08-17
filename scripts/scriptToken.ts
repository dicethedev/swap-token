import { ethers } from "hardhat";

async function main() {

 let [userToken1, userToken2] = await ethers.getSigners();

 const UserAddress = "0xf584f8728b874a6a5c7a8d4d387c9aae9172d621";
//this will send one ether along when deploying
const amountToSent = ethers.utils.parseEther("0.01");

const TokenContract = await ethers.getContractFactory("TokenContract");
const tokenContract = await TokenContract.deploy();

await tokenContract.deployed();

console.log("Token contract deployed to this address: ", tokenContract.address );

//createGrant is a function in the Vault.sol
 const mint = await tokenContract.transfer(userToken2.address, 0,
   {value: amountToSent, UserAddress});

 console.log('value', amountToSent, UserAddress);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
console.error(error);
process.exitCode = 1;
});