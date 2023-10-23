// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

abstract contract GreetingTokenV2 {
  uint256 public version;
  bool public shouldGreet;

  function greet() public returns(string memory) {
    return shouldGreet ? "Hello World!" : "Goodbye";
  }
}