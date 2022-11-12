// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NNGToken is ERC20 {
    constructor() ERC20("NNG Token", "NNG") {
        _mint(msg.sender, 1000000 * 10**decimals());
    }
}
