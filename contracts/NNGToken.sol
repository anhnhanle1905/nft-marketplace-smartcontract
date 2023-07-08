// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NATToken is ERC20 {
    constructor() ERC20("N2 Arena Token", "NAT") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}
