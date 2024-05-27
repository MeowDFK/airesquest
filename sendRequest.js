const { ethers } = require("ethers");
require('dotenv').config();

const alchemyApiKey = process.env.ALCHEMY_API_KEY;
const privateKey = process.env.PRIVATE_KEY;
const contractAddress = process.env.CONSUMER_ADDRESS;

const provider = new ethers.providers.EtherscanProvider("sepolia",process.env.ETHERSCAN_API_KEY);
const wallet = new ethers.Wallet(privateKey, provider);

const contractABI = [
  "function sendRequest() public returns (bytes32 requestId)"
];

const contract = new ethers.Contract(contractAddress, contractABI, wallet);

async function sendRequest() {
  const tx = await contract.sendRequest();
  await tx.wait();
  console.log("Request sent");
}

sendRequest().catch(error => {
  console.error("Error:", error);
});
