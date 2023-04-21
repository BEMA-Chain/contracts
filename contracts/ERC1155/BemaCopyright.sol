// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./ERC1155.sol";
import "./IERC2981.sol";
import "./BemaMusic.sol";

contract Copyright is ERC1155, IERC2981 {
    address private constant BEMA_CHAIN_ADDRESS = 0x123456789; // Dirección del contrato BemaChain
    uint256 private constant ROYALTY_FEE = 10; // Porcentaje de la regalía que se retiene para el propietario del contrato
    uint256 private constant MAX_ROYALTY_FEE = 10000; // El 100% de la regalía
    mapping(uint256 => uint256) private _royalties;

    constructor() ERC1155("https://myapi.com/token/{id}.json") {
        // Inicializar los royalties para cada token
        _royalties[0] = 500; // El 5% de regalía para el creador del token
        _royalties[1] = 200; // El 2% de regalía para el autor de la canción
        _royalties[2] = 300; // El 3% de regalía para el productor de la canción
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view virtual override(ERC1155, IERC165, IERC2981) returns (bool) {
        return
            interfaceId == type(IERC2981).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    function royaltyInfo(
        uint256 tokenId,
        uint256 value
    ) external view override returns (address receiver, uint256 royaltyAmount) {
        uint256 totalRoyalties = (value * _royalties[tokenId]) /
            MAX_ROYALTY_FEE;
        return (BEMA_CHAIN_ADDRESS, totalRoyalties);
    }

    function setRoyalties(
        uint256[] memory tokenIds,
        uint256[] memory royalties
    ) external {
        require(msg.sender == owner(), "Unauthorized");
        require(tokenIds.length == royalties.length, "Invalid input length");

        for (uint256 i = 0; i < tokenIds.length; i++) {
            _royalties[tokenIds[i]] = royalties[i];
        }
    }
}
