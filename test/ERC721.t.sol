// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {AlexErc721} from "../src/ERC721.sol";

contract ERC721Test is Test {
    AlexErc721 erc721;
    address user;
    address user2;
    address operator;

    function setUp() public {
        erc721 = new AlexErc721();
        user = makeAddr("user");
        user2 = makeAddr("user2");
        operator = makeAddr("operator");
    }

    function testSafeMint() public {
        vm.startPrank(user);
        for (uint256 i = 0; i < 3; i++) {
            erc721.safeMint(user);
        }
        assertEq(erc721.balanceOf(user), 3);
    }

    function testErc721TransferFrom() public {
        vm.startPrank(user);
        for (uint256 i = 0; i < 3; i++) {
            erc721.safeMint(user);
        }
        assertEq(erc721.balanceOf(user), 3);
        erc721.transferFrom(user, user2, 2);
        assertEq(erc721.balanceOf(user2), 1);
    }

    function testErc721Approve() public {
        vm.startPrank(user);
        for (uint256 i = 0; i < 3; i++) {
            erc721.safeMint(user);
        }
        erc721.approve(operator, 2);
        assertEq(erc721.getApproved(2), operator);
    }
}
