// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import '../Counter.sol';

contract Fuzz {
  Counter internal counter;

  constructor() {
    counter = new Counter();
  }

  function fuzz_increment() public {
    (bool success, bytes memory returnData) = address(counter).call(
      abi.encodeWithSelector(counter.increment.selector)
    );
    if (!success) {
      if (returnData.length < 68) {
        assert(false);
      }
    }
  }

  function fuzz_testGas() public {
    (bool success, bytes memory returnData) = address(counter).call{
      gas: 1000000
    }(abi.encodeWithSelector(counter.testGas.selector));
    if (!success) {
      if (returnData.length < 68) {
        assert(false);
      }
    }
  }
}
