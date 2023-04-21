// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "ipfs-core-utils";

contract BemaMusic is ERC1155, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    uint256 public mintFee;

    // Struct for storing project/song information
    struct SongDetails {
        string artistEmailAddress;
        string artistFullName;
        string artistStageName;
        string projectSongName;
        string projectType;
        string recordLabelName;
        address[] featuredArtists;
        string artworkHash;
        string primaryMusicGenre;
        string secondaryMusicGenre;
        string languageOfPerformance;
        string[] songwriters;
        address[] songwritersWallets;
        uint256 price;
        string AudioHash;
    }
    struct Song {
        SongDetails SongDetails;
        address Owner;
        bool forSale;
        bool tokenExist;
    }

    mapping(uint256 => Song) private _songData;

    // string tokenURI;

    constructor(
        // string memory _tokenURI,
        uint256 _mintFee
    ) ERC1155("https://bemachain.com/api/item/{id}.json") {
        // tokenURI = _tokenURI;
        mintFee = _mintFee;
        _mint(msg.sender, 0, 100000000000 ether, "");
    }

    // Function to create a new ERC-1155 token for a project/song
    function createToken(
        SongDetails memory _songDetails
    ) public payable returns (uint256) {
        //checkes if the required mint fee was sent
        require(msg.value == mintFee, "Wrong Amount Sent");
        (bool success, ) = payable(Ownable.owner()).call{value: msg.value}("");
        require(success, "Transaction error");
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        // Create new Song struct and Store Song data in mapping
        _songData[newItemId] = Song({
            SongDetails: _songDetails,
            Owner: msg.sender,
            forSale: true,
            tokenExist: true
        });

        // Mint new ERC-1155 token to the contract creator
        _mint(msg.sender, newItemId, 1, "");

        emit SongDataCreated(
            newItemId,
            _songData[newItemId].SongDetails,
            msg.sender
        );

        // Return the new token ID
        return newItemId;
    }

    function getSongData(uint256 tokenId) public view returns (Song memory) {
        return _songData[tokenId];
    }

    // Function to update project/song information for a given token ID
    function updateSongData(
        uint256 tokenId,
        SongDetails memory _songDetails
    ) public {
        // require(_songData[tokenId].artistEmailAddress != address(0), "Token does not exist");
        require(_songData[tokenId].tokenExist, "Token does not exist");
        require(
            _songData[tokenId].Owner == msg.sender,
            "Unauthorized to update song data"
        );
        _songData[tokenId].SongDetails = _songDetails;

        // Emit event to signal that the Song data has been updated
        emit SongDataUpdated(tokenId);
    }

    // Function to check if a token is for sale
    function isTokenForSale(uint256 tokenId) public view returns (bool) {
        //require(_songData[tokenId].artistEmailAddress != address(0), "Token does not exist");
        require(_songData[tokenId].tokenExist, "Token does not exist");
        return _songData[tokenId].forSale;
    }

    // Function to update the forSale status of a token
    function updateTokenForSaleStatus(uint256 tokenId, bool _forSale) public {
        //require(_songData[tokenId].artistEmailAddress != address(0), "Token does not exist");
        require(_songData[tokenId].tokenExist, "Token does not exist");
        require(
            _songData[tokenId].Owner == msg.sender,
            "Unauthorized to update token for sale status"
        );
        _songData[tokenId].forSale = _forSale;
    }

    // Function to get the total number of ERC-1155 tokens
    function getTotalTokens() public view returns (uint256) {
        return _tokenIds.current();
    }

    // Function to get the token ID for a given project/song
    // function getTokenId(address privateWalletKey) public view returns (uint256) {
    //     // Loop through all the tokens and check if the privateWalletKey matches
    //     uint256 totalTokens = _tokenIds.current();
    //     for (uint256 i = 1; i <= totalTokens; i++) {
    //         if (_songData[i].privateWalletKey == privateWalletKey) {
    //             return i;
    //         }
    //     }
    //     // Return 0 if no matching token is found
    //     return 0;
    // }

    // Function to purchase a project/song token
    function purchaseToken(uint256 tokenId) public payable {
        // Get the Song data for the given token ID
        Song storage song = _songData[tokenId]; // Ensure the token is for sale
        require(_songData[tokenId].forSale, "Token is not for sale");

        // Ensure the correct amount of Ether is sent
        require(
            msg.value == _songData[tokenId].SongDetails.price,
            "Incorrect amount of Ether sent"
        );

        // Transfer the token from the contract creator to the buyer
        safeTransferFrom(msg.sender, song.Owner, tokenId, 1, "");

        // Mark the token as no longer for sale
        _songData[tokenId].forSale = false;

        // Emit event to signal that the token has been purchased
        emit TokenPurchased(tokenId, msg.sender);
    }

    // Function to withdraw Ether from the contract
    function withdraw() public onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    // Function to withdraw ERC-20 tokens from the contract
    function withdrawTokens(address tokenAddress) public onlyOwner {
        IERC20 token = IERC20(tokenAddress);
        token.transfer(msg.sender, token.balanceOf(address(this)));
    }

    // Event to signal that the Song data has been created
    event SongDataCreated(
        uint256 tokenId,
        SongDetails _SongDetails,
        address Owner
    );

    // Event to signal that the Song data has been updated
    event SongDataUpdated(uint256 tokenId);

    // Event to signal that a token has been purchased
    event TokenPurchased(uint256 tokenId, address buyer);
}
