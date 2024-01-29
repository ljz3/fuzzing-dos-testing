// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
  uint256 public number;

  function testGas() public {
    if (number >= 50) {
      while (gasleft() < 1000000) {
        assembly {
          // Use log4 since it is the most expensive opcode vs computation ratio
          log4(0, 0, 0, 0, 0, 0)
        }
      }
    }
  }

  function increment() public {
    number++;
  }
}
