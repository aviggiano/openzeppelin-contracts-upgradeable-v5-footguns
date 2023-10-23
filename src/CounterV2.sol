// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/access/Ownable2StepUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract CounterV2 is Initializable, Ownable2StepUpgradeable, UUPSUpgradeable {
    uint256 public number;
    uint256 public multiplier;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() initializer public {
        __Ownable2Step_init();
        __UUPSUpgradeable_init();
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function setMultiplier(uint256 newmultiplier) public {
        multiplier = newmultiplier;
    }

    function increment() public {
        number++;
    }

    function multiply() public {
        number *= multiplier;
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}
}