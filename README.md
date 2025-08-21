# LockToken Solidity Contract

A Foundry project demonstrating a time-lock contract for any ERC20 token. Users can lock their tokens for a specified duration and can only withdraw them once that period has elapsed.

This contract is built using OpenZeppelin's battle-tested `Ownable`, `Pausable`, and `SafeERC20` libraries for enhanced security.

---

## ✨ Features

- **Lock Tokens**: Users can lock a specific amount of an ERC20 token for any duration.
- **Withdraw Tokens**: Users can withdraw their tokens only after the lock duration has expired.
- **Extend Lock**: Users can choose to extend the duration of an existing lock.
- **Multiple Locks**: Users can have multiple, independent locks.
- **Admin Controls**:
    - **Pausable**: The contract owner can pause and unpause core functions (`lock`, `withdraw`) in case of an emergency.
    - **Stuck Token Retrieval**: The owner can retrieve any other ERC20 tokens that are accidentally sent to the contract.
- **View Functions**: Rich set of view functions to query the state of the contract, such as:
    - Get details for a specific lock (`getLockDetails`).
    - Get all lock IDs for a user (`getLocksForUser`).
    - Get total tokens locked in the contract (`totalLocked`).
    - Get total tokens locked by a specific user (`userTotalLockedAmount`).

---

## 🔧 Getting Started with Foundry

### Prerequisites

- [Foundry](https://getfoundry.sh/): You must have Foundry installed.

### Installation & Setup

1.  **Clone the repository:**
    ```bash
    git clone <repository_url>
    cd <repository_name>
    ```

2.  **Install dependencies:**
    This project uses `forge-std` and `openzeppelin-contracts`. Install them using forge:
    ```bash
    forge install OpenZeppelin/openzeppelin-contracts
    forge install foundry-rs/forge-std
    ```

### Build

Compile the contracts to ensure everything is set up correctly:
```bash
forge build
```

### Test

Run the test suite. The `-vvv` flag provides detailed, human-readable trace logs for each test.
```bash
forge test -vvv
```

### Deploy

To deploy the `LockToken` contract, you'll need the address of the ERC20 token you want to be lockable.

Here is a sample deployment command using `forge create`. Replace `YOUR_TOKEN_ADDRESS` with the actual token contract address.

```bash
forge create --rpc-url <your_rpc_url> \
    --private-key <your_private_key> \
    --constructor-args <YOUR_TOKEN_ADDRESS> \
    src/LockToken.sol:LockToken \
    --etherscan-api-key <your_etherscan_key> --verify
```

---

## ⚙️ How It Works

The user workflow is simple and secure:

1.  **Approve**: Before a user can lock tokens, they must first call the `approve()` function on the ERC20 token contract, granting the `LockToken` contract an allowance to spend their tokens.
2.  **Lock**: The user then calls the `lock(amount, duration)` function on the `LockToken` contract. The contract uses `transferFrom` to pull the approved tokens into the contract.
3.  **Wait**: The tokens are held in the contract until `block.timestamp` is greater than or equal to the `unlockTime` of the lock.
4.  **Withdraw**: Once the time has passed, the user can call `withdraw(lockId)` to retrieve their tokens.

---

## 🔒 Security

- **OpenZeppelin Contracts**: Utilizes standard, audited contracts for Ownership, Pausable functionality, and safe ERC20 interactions.
- **Checks-Effects-Interactions Pattern**: State changes are made before external calls (like token transfers) to prevent re-entrancy attacks.
- **Disclaimer**: This contract is for educational purposes. For production use, it should undergo a professional security audit.