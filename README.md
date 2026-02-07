# opencodeblockchaintask
# Student Registry Smart Contract

This project implements a decentralized student registry system on the Ethereum blockchain. It allows users to register their identity using their wallet address and retrieve student details.

## Features
- **Registration:** Maps a student's Name and Roll Number to their Wallet Address.
- **Validation:** Ensures names are not empty, roll numbers are positive, and prevents duplicate registrations from the same wallet.
- **Data Retrieval:** Allows fetching student details using a wallet address.

## Technical Details
- **Network:** [Sepolia / Polygon Amoy / etc.]
- **Solidity Version:** ^0.8.0
- **Contract Address:** [PASTE YOUR DEPLOYED CONTRACT ADDRESS HERE]

## How to Interact
1. Call `registerStudent` with a Name (string) and Roll Number (uint).
2. Call `getStudent` with a wallet address to view details.

## Project Structure
- `StudentRegistry.sol`: The main smart contract source code.
