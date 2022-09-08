// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.14;

import {ERC4626BaseStrategyMock, IERC20} from "./BaseStrategyMock.sol";

import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

contract ERC4626LiquidStrategy is ERC4626BaseStrategyMock {
    constructor(address _vault, address _asset)
        ERC4626BaseStrategyMock(_vault, _asset)
    {}

    // doesn't do anything in liquid strategy as all funds are free
    function _freeFunds(uint256 _amount)
        internal
        override
        returns (uint256 _amountFreed)
    {
        _amountFreed = IERC20(asset()).balanceOf(address(this));
    }

    function maxWithdraw(address owner) public view override returns (uint256) {
        return _convertToAssets(balanceOf(owner), Math.Rounding.Down);
    }
}