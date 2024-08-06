# 🚀 Welcome to Blockchain Basics! 🌐

Let’s dive into the world of blockchain with our step-by-step guide. Whether you're a newbie or an aspiring developer, this guide will help you set up a crypto wallet, get testnet faucets, and deploy your very own Token smart contract on Arbitrum testnet.

## 📚 Table of Contents

- [Setting Up MetaMask 🦊](#setting-up-metamask)
- [Getting Testnet Faucets 💧](#getting-testnet-faucets)
- [Deploying a Token Smart Contract 🖼️](#deploying-a-token-smart-contract)

## Setting Up MetaMask 🦊

### Step 1: Install MetaMask
1. Visit [MetaMask's official website](https://metamask.io/download/).
2. Choose the option to install MetaMask for your browser by clicking "Install MetaMask for Chrome."
3. This will redirect you to the Chrome Web Store. Ensure you are downloading from a trusted source.

### Step 2: Add MetaMask to Chrome
1. Click "Add to Chrome," and then "Add Extension" to install the MetaMask browser extension.
2. Once installed, MetaMask will open automatically.

### Step 3: Create a Wallet
1. Click on the MetaMask icon in your browser and select "Create a Wallet."
2. Create a secure password. This password will be used to unlock the MetaMask extension on your computer.

### Step 4: Backup Your Secret Recovery Phrase
1. Watch the informational video provided by MetaMask to understand how it works.
2. You will then be presented with your Secret Backup Phrase (also known as a recovery phrase or wallet seed phrase).
3. **Important:** This 12-word phrase is your super secret password. Back it up securely. Losing this phrase means losing access to your tokens, and anyone who has this phrase can access your wallet.
4. After backing up your phrase, MetaMask will test your backup by asking you to confirm it.

### Step 5: Secure Your Wallet
1. Follow the security tips provided by MetaMask to enhance the safety of your wallet.
2. Once backed up, you have successfully created and secured your wallet!

### Step 6: Find Your Ethereum Address
1. Click the MetaMask fox icon in the top right corner of your browser to open your wallet.
2. Your Ethereum address is a string of letters and numbers starting with "0x....". Click on it to copy it to your clipboard.
3. For more options, click the three dots to view "Account Details" or "View on Etherscan."

Congratulations! You now have a functional MetaMask wallet to interact with the Ethereum blockchain.

For more details on how to setup a MetaMask wallet, visit [this link](https://codehs.com/tutorial/jkeesh/how-to-set-up-an-ethereum-wallet-on-metamask).

## Getting Testnet Faucets💧

### Step-by-Step Guide to Get Your Testnet Faucet:

1. Go to [this link](https://faucet.lamproslabs.io/) to access the faucet.💸
2. Click on "Connect Wallet" and select your wallet (e.g., MetaMask).🔗
3. Click on "Generate Tweet for Me" and share the tweet as directed.🐦
4. Copy the tweet link and paste it in the provided field, then click "Next."🔗
5. Join the required Discord server by clicking on the provided link, then click "Next."💬
6. Fill out the captcha to verify you're not a robot.✅
7. Click on the "Claim 0.03 ETH" button to receive your testnet ETH.💸

Whooaa! 🎉 You now have the faucet ETH in your address.

## Deploying a Token Smart Contract 🖼️

Let's deploy your very own Token smart contract on the Arbitrum testnet.

### What is an ERC-20 Token?
An ERC-20 token is a type of digital asset on the Ethereum blockchain that adheres to the ERC-20 standard, ensuring consistency and compatibility across the ecosystem.

This standard defines a set of rules and functions that all tokens must follow, allowing them to seamlessly interact with decentralized applications (dApps), wallets, and exchanges on the Ethereum network.

### Step 1: Clone the Repository 
First, let's clone the repository that contains our Token smart contract.

```bash
git clone https://github.com/Bhumi18/erc20-solidity.git
cd erc20-solidity
```
### Step 2: Install Dependencies
Navigate to the cloned repository and install the necessary dependencies. 
```bash
npm install
```

### Step 3: Set the Hardhat Config Variables
You'll need to set three environment variables: ARBITRUM_PRIVATE_KEY, ARBITRUM_RPC_URL, and ARBITRUM_API_KEY. Follow the steps below to obtain the necessary values and set them up:

#### 1. ARBITRUM_PRIVATE_KEY
To export your private key from MetaMask:

- Open MetaMask.
- Go to Account Details.
- Select Export Private Key.
- Important: NEVER put real Ether into testing accounts.

#### 2. ARBITRUM_RPC_URL
To get the RPC URL:

- Sign up for [Alchemy](https://dashboard.alchemy.com/apps/tpvyvhyqno4s4bla/networks).
- Create a new app in Alchemy.
- Go to the Networks section of the app.
- Select Arbitrum Sepolia.
- Copy the link that starts with https://....

#### 3. ARBITRUM_API_KEY
To get your API key:

- Log in to [Arbiscan](https://arbiscan.io/).
- Go to My Account and get your API key.

Run the following commands and add the values when prompted:
```bash
npx hardhat vars set ARBITRUM_PRIVATE_KEY
```
```bash
npx hardhat vars set ARBITRUM_RPC_URL
```
```bash
npx hardhat vars set ARBITRUM_API_KEY
```

By following these steps, you'll have your environment variables set up and ready for use with Arbitrum.

### Step 4: Compile the Smart Contract
Next, let's compile our smart contract to ensure everything is set up correctly. 

```bash
npx hardhat compile
```

### Step 5: Deploy the Contract
With our contract compiled, we can now deploy it to the Arbitrum testnet. Make sure you have the Arbitrum Sepolia faucet in your account, and that you have added the private key correctly.

```bash
npx hardhat ignition deploy ignition/modules/Token.ts --network arbitrumSepolia
```
Boom!🚀 You have just deployed your Token contract. Use the contract address to see your deployed contract on the [explorer](https://sepolia.arbiscan.io/).

### Step 7: Verify the Contract
After deployment, we can verify our contract on Arbitrum Sepolia Scan. 

```bash
npx hardhat verify YOUR_CONTRACT_ADDRESS --network arbitrumSepolia
```
You can see my deployed contract on this [link](https://sepolia.arbiscan.io/address/0x3aE5d117E1f1A337364df89890d9a2d4D405f7AA).

