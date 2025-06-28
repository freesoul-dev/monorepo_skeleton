// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
 * TokenFactory – UUPS proxy that deploys ERC‑721 & ERC‑1155 families.
 * NOTE: This is a skeleton. Fill in access control, upgrade auth, and event schema.
 */

import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

contract TokenFactory is UUPSUpgradeable, AccessControlUpgradeable {
    bytes32 public constant PILOT_ADMIN_ROLE = keccak256("PILOT_ADMIN_ROLE");

    // pilotId => baseTokenId mapping
    mapping(uint256 => uint256) public idCursor;

    event TokenFamilyCreated(uint256 indexed pilotId, uint256 baseId, string standard);

    function initialize(address rootAdmin) public initializer {
        _grantRole(DEFAULT_ADMIN_ROLE, rootAdmin);
        _grantRole(PILOT_ADMIN_ROLE, rootAdmin);
    }

    /// @dev Deploys a minimal‑proxy ERC‑1155/721 with UUPS semantics.
    function createFamily(uint256 pilotId, string memory standard, string memory uri) external onlyRole(PILOT_ADMIN_ROLE) returns (address proxy) {
        /* TODO: implementation – deploy beacon proxy, set uri */
        emit TokenFamilyCreated(pilotId, idCursor[pilotId], standard);
        idCursor[pilotId] += 1e6; // reserve range
    }

    // UUPS upgrade guard
    function _authorizeUpgrade(address newImplementation) internal override onlyRole(DEFAULT_ADMIN_ROLE) {}
}
