# Token Inheritance

## Overview

The Contract Inheritance system presented here consists of three interconnected contracts: Ownable, Pausable, and Token. These contracts demonstrate a hierarchical structure of inheritance in Solidity, allowing for the creation of a token with ownership and pausable functionality.

## Contract :

### Owner Contract

The Ownable contract provides a basic ownership structure. Here is an overview of the functions:

- `onlyOwner`: Ensures that the modified function can only be called by the owner of the contract.

### Pausable Contract

The Pausable contract inherits from Ownable and introduces pausable functionality to the system. Here is an overview of the functions:

- `pause`: Pauses the contract, preventing certain functions from executing.
- `unpause`: Unpauses the contract, allowing normal functions to resume.
- `whenNotPause`: Ensures that the modified function can only be called when the contract is not paused.

### Token Contract

The Token contract inherits from Pausable and extends functionality to handle token transfers. Here is an overview of the functions:

- `transfer`: Transfers tokens from the sender's balance to the specified recipient.
- `mint`: Mint token to address owner.

## Contract Address

- Ownable Address = 0xc0f91195a8f6D346655176388D01Df128D72dD0E (Sepolia Network)
- Pausable Address = 0xcB7E152b5d3E349f82efA58ea0D0Da7424C8E8e3 (Sepolia Network)
- Token Address = 0x2Db85088eDF56574edd8362e91A5beeBBF9F0782 (Sepolia Network)
