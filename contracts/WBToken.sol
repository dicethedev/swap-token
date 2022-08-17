//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import './IERC20.sol';
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract Web3bridgeToken is ERC20 {
    constructor() ERC20("Web3bridgeToken", "WBT") {
        // Minting 100 tokens to the owner address
        _mint(msg.sender, 100 * 10**(decimals()));
    }
}