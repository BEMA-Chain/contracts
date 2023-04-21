// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract BemaToken is IERC20, ERC20Burnable, Pausable, Ownable, ReentrancyGuard {
    struct Song {
        uint256 id;
        address owner;
        uint256 price;
    }
    event TokenForSale(uint256 indexed tokenId, uint256 price);
    
    constructor() ERC20("BemaToken", "BEMA") {
        _mint(msg.sender, 200000000 * 10 ** decimals());
    }
    
    mapping (uint256 => Song) private tokenIdToSong;
    mapping (uint256 => address) private tokenApprovals;
    
    function pause() public onlyOwner {
        _pause();
    }
    function unpause() public onlyOwner {
        _unpause();
    }
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
    function approve(address _to, uint256 _tokenId) public override(ERC20, IERC20) returns (bool) {
    }
    // Function to transfer ownership of a token
    function transferFrom(address _from, address _to, uint256 _tokenId) public override(ERC20, IERC20) returns (bool) {
    // function body here
    
    }
    // Function that allows a user to buy a token
    function buyToken(uint256 _tokenId) public payable {
        address payable owner = payable(address(uint160(tokenIdToSong[_tokenId].owner)));
        owner.transfer(msg.value);

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
}