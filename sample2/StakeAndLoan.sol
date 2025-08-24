// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title StakeAndLoan
 * @dev A contract that allows users to stake collateral tokens and borrow loan tokens.
 */
<<<<<<< ours
contract StakeAndLoan is Ownable {
=======
contract StakeAndLoan is Ownable {
    // --- State Variables ---

    IERC20 public immutable collateralToken;
    IERC20 public immutable loanToken;
>>>>>>> theirs
