// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

abstract contract HappyToken {
    bool public happy;

    function isHappy() public view returns (bool) {
        return happy;
    }
}
