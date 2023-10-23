// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

abstract contract GreetingToken {
    uint256 public version;

    function greet() public pure returns (string memory) {
        return "Hello World!";
    }
}