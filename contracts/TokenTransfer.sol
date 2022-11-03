// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenTransfer {
    IERC20 _token;

    mapping(address => uint256) public balances;
    address owner;

    // token = NAIN's contract address
    constructor() {
        address token = 0xFced2B7B391074805b67af672A2a0321623b8A1E; //address sc NAIN
        _token = IERC20(token);
        owner = msg.sender;
    }

    modifier _onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }
    modifier checkAllowance(uint256 amount) {
        require(
            _token.allowance(msg.sender, address(this)) >= amount,
            "Error allowance"
        );
        _;
    }

    function depositTokens(uint256 _amount) public checkAllowance(_amount) {
        require(
            _token.balanceOf(msg.sender) >= _amount,
            "Token does't enough, please check again!"
        );
        _token.transferFrom(msg.sender, address(this), _amount);
    }

    function withdrawTokens(address _receipient, uint256 _amount)
        public
        _onlyOwner
    {
        require(
            _token.balanceOf(address(this)) >= _amount,
            "Token does't enough, please check again!"
        );
        _token.transfer(_receipient, _amount);
    }

    function depositETH(uint256 _amount)
        public
        payable
        _onlyOwner
        returns (bool)
    {
        require(
            _amount == msg.value,
            "Value does't enough, please check again!"
        );
        return true;
    }

    function withdrawETH(uint256 _amount, address payable _recipient)
        public
        _onlyOwner
        returns (bool)
    {
        payable(_recipient).transfer(_amount);
        return true;
    }

    function withdrawEthToOwner(uint256 _amount)
        public
        _onlyOwner
        returns (bool)
    {
        payable(msg.sender).transfer(_amount);
        return true;
    }

    function getSmartContractBalance() external view returns (uint256) {
        return _token.balanceOf(address(this));
    }

    function getUserBalance() external view returns (uint256) {
        return _token.balanceOf(msg.sender);
    }

    function viewAllowance() external view returns (uint256) {
        return _token.allowance(msg.sender, address(this));
    }

    receive() external payable {}
}
