// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public owner;

    constructor() ERC20("iCoin", "ic") {
        owner = msg.sender;
        _mint(owner, 100 * 10**decimals());
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can mint tokens");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }
}
