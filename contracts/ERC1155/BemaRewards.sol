// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


contract BemaRewards is ReentrancyGuard{
    using SafeMath for uint256; // Add this line

    mapping(address => uint256) public userPoints;
    uint256 public pointsPerMinute = 500;
    uint256 public pointsPerPlaylist = 1000;
    uint256 public pointsPerShare = 1000;
    uint256 public pointsPerNewUser = 2000;
    uint256 public pointsPerInteraction = 500;
    uint256 public pointsPerWeek = 5000;
    uint256 public pointsPerEvent = 10000;
    uint256 public pointsPerReport = 25000;
    uint256 public pointsPerFeature = 50000;
    uint256 public pointsToBemaCoinConversion = 1000;
    
       

    function streamMusic(uint256 minutesStreamed) public {
        uint256 pointsEarned = minutesStreamed * pointsPerMinute;
        userPoints[msg.sender] += pointsEarned;
    }

    function createPlaylist() public {
        userPoints[msg.sender] += pointsPerPlaylist;
    }

    function shareContent() public {
        userPoints[msg.sender] += pointsPerShare;
    }

    function inviteNewUser(address newUser) public {
        userPoints[msg.sender] += pointsPerNewUser;
        userPoints[newUser] += pointsPerNewUser;
    }

    function interact() public {
        userPoints[msg.sender] += pointsPerInteraction;
    }

    function discoverNewMusic() public {
        userPoints[msg.sender] += pointsPerWeek;
    }

    function participateInEvent() public {
        userPoints[msg.sender] += pointsPerEvent;
    }

    function contributeToPlatform(bool report, bool featureImplemented) public {
        if (report) {
            userPoints[msg.sender] += pointsPerReport;
        }
        if (featureImplemented) {
            userPoints[msg.sender] += pointsPerFeature;
        }
    }

    function convertPointsToBemaCoin() public view returns (uint256) {
        uint256 totalPoints = userPoints[msg.sender];
        return totalPoints / pointsToBemaCoinConversion;
    }

    function calculateDailyPointsEarned() public view returns (uint256) {
        uint256 pointsEarned = 0;
        pointsEarned += 24 * 60 * pointsPerMinute; // Streaming music for 1 hour
        pointsEarned += pointsPerPlaylist; // Creating a playlist
        pointsEarned += pointsPerShare; // Sharing content on social media
        pointsEarned += pointsPerNewUser; // Inviting a new user
        pointsEarned += 2 * pointsPerInteraction; // Liking and commenting on a few songs
        pointsEarned += pointsPerWeek; // Discovering new music
        pointsEarned += pointsPerEvent; // Participating in a community event
        pointsEarned += pointsPerFeature; // Submitting a feature suggestion that is implemented
        return pointsEarned;
    }
    
    function redeemPoints(uint256 pointsToRedeem) public nonReentrant {
        require(userPoints[msg.sender] >= pointsToRedeem, "Not enough points to redeem.");

        userPoints[msg.sender] -= pointsToRedeem;

        // transfer BemaCoins or other incentives to the user's address
        // code to transfer BemaCoins or other incentives
    }
}