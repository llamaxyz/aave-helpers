// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {IERC20} from 'solidity-utils/contracts/oz-common/interfaces/IERC20.sol';
import {SafeERC20} from 'solidity-utils/contracts/oz-common/SafeERC20.sol';
import {AaveV2Ethereum} from 'aave-address-book/AaveV2Ethereum.sol';

import {ISwapPayload} from './interfaces/ISwapPayload.sol';

abstract contract BaseSwapPayload is ISwapPayload {
  using SafeERC20 for IERC20;

  function _deposit(address token, uint256 amount) internal virtual {
    IERC20(token).safeTransfer(address(AaveV2Ethereum.COLLECTOR), amount);
  }
}
