// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * SupplyController – strategy pattern for pilot‑specific token issuance.
 */

interface ISupplyPolicy {
    function computeMint(address to, bytes calldata data) external view returns (uint256 amount);
}

contract SupplyController {
    ISupplyPolicy public policy;
    address public token;

    constructor(address _token, ISupplyPolicy _policy) {
        token = _token;
        policy = _policy;
    }

    function issue(address to, bytes calldata data) external {
        uint256 amount = policy.computeMint(to, data);
        // TODO: call token.mint(to, amount);
    }
}
