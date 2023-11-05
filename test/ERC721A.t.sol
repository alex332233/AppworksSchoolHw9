// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {AlexErc721A} from "../src/ERC721A.sol";

contract ERC721ATest is Test {
    AlexErc721A erc721a;
    address user;
    address user2;
    address operator;

    function setUp() public {
        erc721a = new AlexErc721A();
        user = makeAddr("user");
        user2 = makeAddr("user2");
        operator = makeAddr("operator");
    }

    function testMint() public {
        vm.startPrank(user);
        erc721a.mint(3);
        assertEq(erc721a.balanceOf(user), 3);
    }

    function testErc721aTransferFrom() public {
        vm.startPrank(user);
        erc721a.mint(3);
        assertEq(erc721a.balanceOf(user), 3);
        erc721a.transferFrom(user, user2, 2);
        assertEq(erc721a.balanceOf(user2), 1);
    }

    function testErc721aApprove() public {
        vm.startPrank(user);
        erc721a.mint(3);
        erc721a.approve(operator, 2);
        assertEq(erc721a.getApproved(2), operator);
    }
}
