// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

/**
 * Registry – keeps per‑pilot configuration on‑chain.
 */
contract Registry is Initializable, OwnableUpgradeable {
    struct Config {
        address treasury;
        address governor;
        address oracleRouter;
        bytes32 paramsHash;
    }

    mapping(uint256 => Config) public configs;

    event ConfigSet(uint256 indexed pilotId, Config cfg);

    function initialize(address owner) public initializer {
        __Ownable_init(owner);
    }

    function setConfig(uint256 pilotId, Config calldata cfg) external onlyOwner {
        configs[pilotId] = cfg;
        emit ConfigSet(pilotId, cfg);
    }
}
