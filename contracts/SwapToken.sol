// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./IERC20.sol";

contract SwapTokenTime {

    IERC20 public blessingToken;
    address public owner1;
    IERC20 public web3bridgeToken;
    address public owner2;
    uint public amount1;
    uint public amount2;
    uint public swapRate;

    constructor(address _blessingToken, address _owner1, uint256 _amount1,
         address _web3bridgeToken, address _owner2,
        uint256 _amount2) {
        blessingToken = IERC20(_blessingToken);
        owner1 = _owner1;
        amount1 = _amount1;
        web3bridgeToken = IERC20(_web3bridgeToken);
        owner2 = _owner2;
        amount2 = _amount2;
    }

    function swap() public {
        require(msg.sender == owner1 || msg.sender == owner2, "Not authorized");
        require(
            blessingToken.allowance(owner1, address(this)) >= amount1,
            "Token 1 allowance too low"
        );
        require(
            web3bridgeToken .allowance(owner2, address(this)) >= amount2,
            "Token 2 allowance too low"
        );

        _safeTransferFrom(blessingToken, owner1, owner2, amount1);
        _safeTransferFrom(web3bridgeToken, owner2, owner1, amount2);
    }

    function _safeTransferFrom(
        IERC20 token,
        address sender,
        address recipient,
        uint amount
    ) private {
        bool sent = token.transferFrom(sender, recipient, amount);
        require(sent, "Token transfer failed");
    }
}