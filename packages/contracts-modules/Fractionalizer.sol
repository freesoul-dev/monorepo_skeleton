// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * Fractionalizer – locks an ERC‑721 (or 1155‑1) and mints ERC‑20 share tokens.
 * This skeleton omits security checks and price‑feed hooks; implement before prod!
 */

interface IERC20Minimal {
    function mint(address to, uint256 amount) external;
    function burn(address from, uint256 amount) external;
}

interface IERC721 {
    function transferFrom(address from, address to, uint256 tokenId) external;
}

contract Fractionalizer {
    event Fractionalized(address indexed nft, uint256 tokenId, address shareToken, uint256 supply);
    event Defractionalized(address indexed nft, uint256 tokenId);

    function deposit721(address nft, uint256 tokenId, uint256 supply) external returns (address shareToken) {
        // TODO: create minimal proxy ERC‑20 w/ name/symbol
        // lock NFT in contract and mint shares
        emit Fractionalized(nft, tokenId, shareToken, supply);
    }

    function defractionalize(address nft, uint256 tokenId) external {
        // TODO: burn shares and unlock NFT
        emit Defractionalized(nft, tokenId);
    }
}
