// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "../src/MyToken.sol";
import "../src/MyTokenV2.sol";

contract MyTokenTest is Test {
    MyToken public token;
    ERC1967Proxy public proxy;

    function setUp() public {
        proxy = new ERC1967Proxy(
            address(new MyToken()),
            abi.encodeWithSelector(
                MyToken.initialize.selector,
                address(this)
            )
        );
        token = MyToken(address(proxy));
    }

    function testTokenV1HappyToken() public {
        assertTrue(token.isHappy());
    }
    function testTokenV1GreetingToken() public {
        assertTrue(keccak256(abi.encodePacked(token.greet())) == keccak256(abi.encodePacked("Hello World!")));
    }
    function testTokenV2HappyToken() public {
        UUPSUpgradeable(address(proxy)).upgradeToAndCall(address(new MyTokenV2()), "");
        token = MyToken(address(proxy));

        assertTrue(token.isHappy());
    }
    function testTokenV2GreetingToken() public {
        UUPSUpgradeable(address(proxy)).upgradeToAndCall(address(new MyTokenV2()), "");
        token = MyToken(address(proxy));

        assertTrue(keccak256(abi.encodePacked(token.greet())) == keccak256(abi.encodePacked("Hello World!")));
    }
}

