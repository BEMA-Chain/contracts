// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";
//import {BemaToken} from "./BemaToken.sol";
//import {BemaSale} from "./BemaSale.sol";
import {BemaReward} from "./BemaReward.sol";
import {BemaCopyright} from "./BemaCopyright.sol";
import {BemaMusic} from "./BemaMusic.sol";

contract Bema is ReentrancyGuard {
    //BemaToken public tokenContract;
    //BemaSale public saleContract;
    BemaReward public rewardContract;
    BemaCopyright public copyContract;
    BemaMusic public musicContract;

    constructor() {
        tokenContract = new BemaToken();
        saleContract = new BemaSale(tokenContract);
        rewardContract = new BemaReward(tokenContract);
        copyContract = new BemaCopy(tokenContract);
        musicContract = new BemaMusic(tokenContract);
    }
}
