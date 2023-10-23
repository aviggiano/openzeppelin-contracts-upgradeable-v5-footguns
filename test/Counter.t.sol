// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "../src/Counter.sol";
import "../src/CounterV2.sol";

contract CounterTest is Test {
    Counter public counter;
    ERC1967Proxy public proxy;

    function setUp() public {
        counter = new Counter();

        proxy = new ERC1967Proxy(
            address(new Counter()),
            abi.encodeWithSelector(Counter.initialize.selector)
        );
        counter = Counter(address(proxy));
        counter.setNumber(0);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function testCounterUpgrade() public {
        UUPSUpgradeable(address(proxy)).upgradeToAndCall(address(new CounterV2()), "");
        counter = Counter(address(proxy));
    }
}
