// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "ERC721A/ERC721A.sol";

contract AlexErc721A is ERC721A {
    constructor() ERC721A("AlexErc721A", "AE7A") {}

    function mint(uint256 quantity) external payable {
        // `_mint`'s second argument now takes in a `quantity`, not a `tokenId`.
        _mint(msg.sender, quantity);
    }
}
