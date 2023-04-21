// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract BemaToken is IERC20, Ownable, ReentrancyGuard {
    using SafeMath for uint256;
    string private _name = "BemaToken";
    string private _symbol = "BEMA";
    uint8 private _decimals = 18;
    uint256 private _totalSupply = 200000000 * (10 ** uint256(_decimals));
    address private _burnAddress = 0x000000000000000000000000000000000000dEaD;
    
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;
    // A mapping to keep track of approved token transfers
    mapping (uint256 => address) private tokenApprovals;

    
    constructor() {
        _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }
    function name() public view returns (string memory) {
        return _name;
    }
    function symbol() public view returns (string memory) {
        return _symbol;
    }
    function decimals() public view returns (uint8) {
        return _decimals;
    }
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }
    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address _to, uint256 _tokenId) public {
        // Verify that the caller is the owner of the token
        require(tokenIdToSong[_tokenId].owner == msg.sender, "Invalid owner");

        // Approve the transfer
        tokenApprovals[_tokenId] = _to;

        // Emit an Approval event
        emit Approval(tokenIdToSong[_tokenId].owner, _to, _tokenId);
    }

    // Function to transfer ownership of a token
    function transferFrom(address _from, address _to, uint256 _tokenId) public {
        // Verify that the transfer is approved
        require(tokenApprovals[_tokenId] == _to, "Transfer not approved");

        // Verify that the owner of the token is _from
        require(tokenIdToSong[_tokenId].owner == _from, "Invalid owner");

        // Transfer ownership of the token
        tokenIdToSong[_tokenId].owner = _to;

        // Clear the approval
        delete tokenApprovals[_tokenId];

        // Emit a Transfer event
        emit Transfer(_from, _to, _tokenId);
    }
    // Function that allows a user to buy a token
    function buyToken(uint256 _tokenId) public payable {
        // Verify that the user has sent enough Ether to purchase the token
        require(msg.value >= tokenIdToSong[_tokenId].price, "Insufficient funds");

        // Verify that the token is valid and is owned by the seller
        require(tokenIdToSong[_tokenId].id != 0, "Invalid token ID");
        require(tokenIdToSong[_tokenId].owner != msg.sender, "You already own this token");

        // Transfer ownership of the token from the seller to the buyer
        transferFrom(tokenIdToSong[_tokenId].owner, msg.sender, _tokenId);

        // Transfer the Ether to the seller
        tokenIdToSong[_tokenId].owner.transfer(msg.value);
    }

    // Function that allows the owner of a token to put it up for sale
    function sellToken(uint256 _tokenId, uint256 _price) public {
        // Verify that the caller is the owner of the token
        require(tokenIdToSong[_tokenId].owner == msg.sender, "Invalid owner");

        // Verify that the price is greater than zero
        require(_price > 0, "Price must be greater than zero");

        // Set the price of the token
        tokenIdToSong[_tokenId].price = _price;

        // Emit a TokenForSale event
        emit TokenForSale(_tokenId, _price);
    }

    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].add(addedValue));
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }
    function _approve(address owner, address spender, uint256 amount) internal {
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function mint(address account, uint256 amount) public onlyOwner returns (bool) {
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
        return true;
    }
        
    function burn(uint256 amount) public returns (bool) {
        _burn(msg.sender, amount);
        return true;
    }

    function burnFrom(address account, uint256 amount) public returns (bool) {
        _approve(account, msg.sender, _allowances[account][msg.sender].sub(amount, "ERC20: burn amount exceeds allowance"));
        _burn(account, amount);
        return true;
    }

    function _burn(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, _burnAddress, amount);
    }
}

