# Bema Hardhat Project
<<<<<<< HEAD

1. Management Technologies.
    Link Drive: https://docs.google.com/document/d/1G-zssV_tvCEW-e6lIh5Cs226UHwrP4p41Yjl2j3AXao/edit?usp=share_link
2. Structure: Web3.
    Link Drive: https://drive.google.com/drive/folders/1RDqSgtDwpgC_y_FLiI5USOZSxaiFOUQv
3. System Analysis Report (Abril):
    Link Drive: https://docs.google.com/document/d/1mhJZfLwwIjiIH1iz6AMlzGCvFgluMJCbfB_hsboldVQ/edit?usp=share_link
4. Solution System: Building.
5. Testing Smart Contracts (Plan Actions)
6. Provide the corresponding Scripts to use the backend area
=======



Try running some of the following tasks:
>>>>>>> 14bee600e7abe561005c3369011407fc79daaf69

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```
Token: ERC-20 Test

BemaToken Contract: 0xFd7342030374CE6Ae765033f48DE477E11d73bd2

Link BemaToken: https://mumbai.polygonscan.com/token/0xfd7342030374ce6ae765033f48de477e11d73bd2

Token Governor: ERC20

Note: Console
```Compile: npx hardhat compile
test: npx hardhat test
deploy: npx hardhat run scripts/deploy.js

npx hardhat node
npx hardhat run scripts/deploy.js --network polygon

```

Docker: Build

```
docker build -t bema-contracts .

docker run -p 3000:3000 bema-contracts

npx hardhat compile --network docker


```
Functions:
```
A continuation with sample a list of all the functions of governance of BEMA:
Governance
propose(address[] calldata targets, uint256[] calldata values, string[] calldata signatures, bytes[] calldata calldatas, string calldata description)
queue(uint proposalId)
execute(uint proposalId)
cancel(uint proposalId)
getActions(uint256 proposalId) external view returns (address[] memory targets, uint256[] memory values, string[] memory signatures, bytes[] memory calldatas)
getReceipt(uint256 proposalId, address voter) external view returns (Receipt memory)
getProposalThreshold() external view returns (uint256)
getVoteThreshold() external view returns (uint256)
getProposalById(uint256 proposalId) external view returns (Proposal memory)
getProposalsCount() external view returns (uint256)
getProposals(uint256 offset, uint256 limit, bool onlyOpen) external view returns (Proposal[] memory)
castVote(uint256 proposalId, bool support)
castVoteBySig(uint256 proposalId, bool support, uint8 in, bytes32 r, bytes32 s)


Staking
stake(uint256 amount)
unstake(uint256 amount)
cooldown()
withdraw()
withdrawAll()
getStake(address stakes) external view returns (uint256 amount, uint256 cooldownEndTime)
getGlobalCooldown() external view returns (uint256)


Treasury:
proposeFeeUpdate(uint256 newFee, string calldata reason)
approveFeeUpdate(uint256 proposalId)
vetoFeeUpdate(uint256 proposalId)
proposeTaxUpdate(uint256 newTax, string calldata reason)
approveTaxUpdate(uint256 proposalId)
vetoTaxUpdate(uint256 proposalId)
transferERC20(address token, address to, uint256 amount)
getTreasuryBalance(address token) external view returns (uint256)


Claims
claim(uint256 amount, uint256 round, bytes32[] calldata proof)
getUnclaimedAmount(address user) external view returns (uint256)
getClaimedAmount(address user) external view returns (uint256)
Delegation
delegate(address delegatee)
delegated (address delegatee)
getDelegation(address delegator) external view returns (address delegatee, uint256 amount)
getVotes(address delegatee) external view returns (uint256)
Registry
proposeRegistryAccessUpdate(address userAddress, bool status, string calldata reason)
approveRegistryAccessUpdate(uint256 proposalId)
vetoRegistryAccessUpdate(uint256 proposalId)
proposeParameterUpdate(bytes32 key, uint256 value, string calldata reason)
approveParameterUpdate(uint256 proposalId)
vetoParameterUpdate(uint256 proposalId)
proposeGovernanceAddressUpdate(address newAddress, string calldata reason)
approveGovernanceAddressUpdate(uint256 proposalId)
vetoGovernanceAddressUpdate(uint256 proposalId)
getRegistryAccess(address userAddress) external view returns (bool)
getParameter(bytes32 key) external view returns (uint256)
getGovernanceAddress() external view returns (address)
ServiceTypeManager
proposeServiceType(uint32 serviceType, string calldata metadataURI,string calldata reason)
approveServiceType(uint256 proposalId)
vetoServiceType(uint256 proposalId)
getServiceTypeInfo(uint32 serviceType) external view returns (string memory metadataURI,uint32 minServiceFee)
ServiceTypeRegistrar
register(uint32 serviceType)
unregister(uint32 serviceType)
getRegisteredServiceTypes() external view returns (uint32[] memory)
Delegate




revokeOperator – Revokes permissions for a particular operator.
renounceOwnership – Allows the current owner to renounce their ownership.
transferOwnership – Allows the current owner to transfer ownership to another address.
addOrUpdateContentNode – Adds or updates a content node.
removeContentNode – Removes an existing content node.
registerServiceType: registers a new type of service in the system.
addServiceVersion – Adds a new version of an existing service.
registerService: registers an existing service in the system.
deregisterService – Removes an existing service from the system.
setServiceAdminFee – Sets the administration fee for a particular service.
setServiceTypeAdminFee – Sets the administration fee for a particular type of service.
setBemaTokenAddress – Sets the address of the Bema token contract.
setRegistryAddress – Sets the address of the registry contract.
setDiscoveryProviderAddress – Sets the discovery provider address.
setStakingAddress – Sets the staking contract address.
setTreasuryConfig – Sets the treasury configuration.
setGovOwnershipAddress – Sets the address of the governance property.
setGovContractRegistryAddress – Sets the governance contract registry address.
setDelegateManagerAddress – Sets the address of the delegate manager.
setGovernanceRouterAddress – Sets the address of the governance router.
setServiceTypeManagerAddress – Sets the address of the service type manager.
setStakingOwnerAddress – Sets the staking owner address.
setDelegateOwnerAddress – Sets the delegate owner address.
setDelegateRegistryAddress – Sets the address of the delegate registry.
setFactoryAddress – Sets the address of the contract factory.
setTokenMigrationProxyAddress – Sets the address of the token migration proxy.
setTokenMigrationMasterAddress – Sets the token migration master address.




getTreasuryConfig - Gets the current treasury configuration
setTreasuryConfig – update treasury configuration
initRewardDistributor – initializes the reward distribution contract
claimRewards – Allows a user to claim their pending distribution rewards
setRewardsManager – update the rewards management contract
setRewardRecipient: update the recipient of the rewards
getAccountRewards – Gets pending rewards for an account
getAccountTotalClaimedRewards - Gets the total rewards claimed for an account
getAccountClaimableRewards – Gets the rewards an account can currently claim
getRewardDistribution – Gets the current status of the reward distribution
getRewardDistributionStatus – Gets the current status of reward distribution for a specific user
getTotalDistributedRewards - Gets the total rewards distributed so far
getTotalUnclaimedRewards - Gets the total unclaimed rewards
getTotalClaimedRewards - Gets the total rewards claimed so far
setClaimGasPrice – Sets the gas price for claiming rewards
setRewardDistributorWhitelist – sets a whitelist for the reward distribution contract
createCreatorCoin – Create a new creator coin
updateCreatorCoin – Updates an existing creator coin
mintAndTransfer – Issue a number of creator coins and transfer them to an account
burn: burns a number of creator coins
transfer: transfer creator coins from one account to another
approve – Gives an account permission to transfer Creator Coins on behalf of another account
allowance – Gets the amount of Creator Coins that one account has given another account permission to transfer
createBemaLibs – Creates a new BemaLibs contract
setBemaLibs – Updates the BemaLibs contract used by the content provider registration contract
getRegisteredLibraries - Gets a list of registered BemaLibs contracts
hasBeenDeleted: Check if a content provider has been deleted
getServiceProvider - Gets information about a service provider
getServiceProviderIds - Gets a list of service provider ids
getRegisteredServiceTypeIds - Gets a list of registered service type ids
getServiceTypeMinDeposits – Gets the minimum deposits required for each type of service
getServiceTypeMaxDeposits - Gets the maximum deposits allowed for each type of service
getServiceTypeDefaultDeposits - Gets the default deposits for each type of service
getServiceTypeMaxMintAmounts: Gets the max amounts






updateServiceTypeGasPrice - Updates the gas price for a type of service.
updateServiceType - Updates the cost and fees for a service type.
updateRepostFrequency - Updates the frequency allowed for posting reposts.
updateRepostCooldownSeconds - Updates the cooldown time for posting reposts.
updateRepostPayee - Update the account that will receive payments for reposts.
updateTrackPayee - Update the account that will receive payments for song plays.
updateDelegateOwner - Updates the delegate account for an owner.
updateDelegate - Updates the delegate account for a user.
updateDelegateList - Updates the list of delegated accounts for a user.
setServiceTypeBemaCoinRewards - Set the Bema Coin rewards for a service type.
getDelegateOwner - Gets the owner of a delegated account.
getDelegatedBalance - Gets a user's delegated balance.
getStakeTarget - Gets a user's stake target.
getOwnerAndAmount - Gets the owner information and the amount of an account.
getOwnerAndBeneficiary - Gets the owner and beneficiary information for an account.
getTotalStaked - Gets the total funds staked.
getTotalStakedForDelegate - Gets the total funds staked for a delegated account.
getStakeTargetHitCount - Gets the number of times the stake target has been hit for a user.
getRound - Gets the current round number.
getCurrentEpochNumber - Gets the current epoch number.
getCurrentEpochStartTime - Gets the start time of the current epoch.
getCurrentEpochEndTime - Gets the end time of the current epoch.
getEpochRewards - Gets the rewards available for an epoch.
getUnlockedBalance - Gets a user's unlocked balance.
getLockedBalance - Gets a user's locked balance.
getUnlockingSchedule - Gets the unlock schedule for a user.
getUnlockingScheduleEntry - Gets an unlock schedule entry for a user.
getGlobalRewards - Gets the rewards available to all users.
getTreasuryBalance - Gets the current balance of the treasury.
getTreasuryFee - Gets the current treasury fee.
getGovernanceShareOfTreasury - Gets the governance share of the treasury.
getPrimaryTreasuryFeeBasisPoints - Gets the primary treasury fee point base.
getSecondaryTreasuryFeeBasisPoints - Gets the secondary treasury fee point base.
getTreasuryFeeSink - Gets




ServiceTypeManager.sol:
getServiceType
getServiceTypes
addServiceType
updateServiceType
deleteServiceType
ServiceProviderFactory.sol:
createProvider
setServiceTypeManager
getServiceTypeManager


ServiceProviderRegistrationManager.sol:
initialize
register
approve
deny
transferOwnership
setServiceTypeManager
getServiceTypeManager
setFactRegistryManager
getFactRegistryManager
setProviderFactory
getProviderFactory
setBemaTokenAddress
getBemaTokenAddress
setDelegateOwnerWalletAddress
getDelegateOwnerWalletAddress
setMaximumRegistrationLength
getMaximumRegistrationLength
setMinimumAPR
getMinimumAPR


FactRegistryManager.sol:
initialize
getFact
addFact
setProviderFactory
getProviderFactory
setDelegateOwnerWalletAddress
getDelegateOwnerWalletAddress


ContractDeployer.sol:
deployer
initialize
Treasury.sol:
initialize
deposit
withdraw
getBalance
TimedVoteController.sol:
initialize
submitVote
getVoteStatus
getResults
cancelVote
executeVote
getMinimumBalanceToPropose
setMinimumBalanceToPropose
getMinimumQuorumSize
setMinimumQuorumSize
getVoteTimeParams
setVoteTimeParams
getQuadraticVotingParams
setQuadraticVotingParams
setControllerOwner
setBemaTokenAddress
getBemaTokenAddress
setVoteControllerAddress
getVoteControllerAddress
setDelegateOwnerWalletAddress
getDelegateOwnerWalletAddress
StakingPoolFactory.sol:
initialize
createStakingPool
getAllStakingPools
getStakingPoolsByOwner
setPoolRegistrar
getPoolRegistrar
setBemaTokenAddress
getBemaTokenAddress
setDelegateOwnerWalletAddress
getDelegateOwnerWalletAddress


StakingPool.sol:
initialize
stake
unstake
claim
restake
getStakerInfo
getStakedBalance
setBemaTokenAddress
getBemaTokenAddress
setPoolRegistrar
getPoolRegistrar
setDelegateOwnerWalletAddress
getDelegateOwnerWalletAddress


PoolRegistrar.sol:
initialize
registerPool
removePool
setStakingPoolFactory
getStakingPoolFactory
setBemaTokenAddress
getBemaTokenAddress
setDelegateOwnerWalletAddress
getDelegateOwnerWalletAddress


GovernanceVerifier.sol:
initialize
verify
setDelegateOwnerWalletAddress
getDelegateOwnerWalletAddress


GovernanceToken.sol:
initialize
as
burn
setBemaTokenAddress
getBemaTokenAddress
setDelegateOwnerWalletAddress
getDelegateOwnerWalletAddress


GovernanceTimeLock.sol:
initialize
lock
unlock
setBemaTokenAddress








updateDelegateKey(address newDelegateKey): Allows you to update the user's delegated key.
getNumberOfUsers(): Returns the total number of users registered in the system.
getUsersPaginated(uint256 offset, uint256 limit): Returns a paginated list of users logged on to the system, starting at the specified offset index and limiting the number of users returned to the specified limit value.
transfer(address to, uint256 value): Transfers a specified number of tokens to a destination address.
transferFrom(address from, address to, uint256 value): Transfers a specified number of tokens from the specified sender address to a specified destination address.
approve(address spender, uint256 value): Approves that a destination address can spend a specified number of tokens on behalf of the sender.
increaseAllowance(address spender, uint256 addedValue): Increases the maximum amount that the destination address can spend on behalf of the sender.
decreaseAllowance(address spender, uint256 subtractedValue): Decreases the maximum amount that the destination address can spend on behalf of the sender.
getCurrentEpoch(): Returns the current epoch number.
getNumActiveProposals(): Returns the total number of active proposals.
getProposalsPaginated(uint256 offset, uint256 limit): Returns a paginated list of proposals, starting at the specified scroll index and limiting the number of proposals returned to the specified limit value.
submitVote(uint256 proposalIndex, bool vote): Allows a user to cast a vote on a specific proposal.
cancelProposal(uint256 proposalIndex): Cancels an existing proposal.
finalizeProposal(uint256 proposalIndex): Ends an existing proposal and executes the associated action if it is approved.
addAdmin(address account): Adds an address to the list of system administrators.
removeAdmin(address account): Removes an address from the list of system administrators.
isRegisteredService(address account): returns whether a given address is registered as a service in the system.
getServiceVersion(address service): returns the current registered version of a particular service.




getDelegateAt – Returns the address of the delegate registered in a specified Ethereum block for a given user.
getTotalStaked – Returns the total tokens in the blockchain's staked whitelist.
incrementChainEpoch – Increases the number of epochs in the blockchain.
initializeProvider – Initializes a provider on the blockchain.
isOwnerOrDelegate – Returns a Boolean indicating whether the address calling the function is the contract owner or a registered delegate.
isRegisteredUser – Returns a Boolean indicating whether an address is registered as a user on the blockchain.
isUserPermitted – Returns a Boolean indicating whether a user address can perform specific actions on the blockchain.
lockStake – Locks an amount of tokens in the blockchain's whitelisted stake.
migrateEpochStakers – migrates stakers from the old epoch to the new one.
migrateOldProviderFees – Migrate old provider fees to a new provider.
migrateOldUserFees – migrates old user fees to a new user.
migrateStake – migrates a number of tokens to the blockchain stake whitelist.
migrateStakers – Migrates stakers to a new blockchain staking whitelist.
migrateUserStake – migrates a number of tokens from a user to the blockchain staking whitelist.
migrateUsers – Migrate users to a new blockchain.
onOwnershipTransferred – Executes when ownership of a contract is transferred to a new address.
owner: Returns the address of the owner of the contract.
renounceOwnership – Relinquishes ownership of the contract, which means there will be no established owner.
setDelegate – Registers a delegate address on the blockchain.
setProvider – Sets the address of a provider on the blockchain.
setUserFactory – Sets the address of the user factory in the blockchain.
transferOwnership – Transfers ownership of the contract to a new address.






updateServiceType: updates the type of service that a service provider offers for the Bema network.
updateServiceTypeDelegation: Allows delegates to update the type of service that a service provider offers for the Bema network.
updateServiceURI – Updates the URI pointing to a server providing the service on the Bema network.
updateServiceURIDelegation – Allows delegates to update the URI pointing to a server providing the service on the Bema network.
setStorage – Updates the address of the Bema network content storage contract.
setStorageDelegation – Allows delegates to update the Bema network content storage contract address.
setDiscoveryProvider – Updates the contract address of the Bema network discovery provider.
setDiscoveryProviderDelegation – Allows delegates to update the contract address of the Bema network discovery provider.
updateTrackMetadata: Updates the metadata of an audio track on the Bema network.
updateTrackMetadataDelegation - Allows delegates to update the metadata of an audio track on the Bema network.
updateTrackOwnership: updates the ownership of an audio track on the Bema network.
updateTrackOwnershipDelegation – Allows delegates to update ownership of an audio track on the Bema network.
updateNodeOperator: Updates the operator address of a Bema network node.
updateNodeOperatorDelegation – Allows delegates to update the operator address of a Bema network node.
setDelegate - Adds a delegate for a user on the Bema network.
removeDelegate - Removes a delegate for a user on the Bema network.
setGovernanceVotingPeriod – Updates the voting period for governance proposals on the Bema network.
setVoteStakingMinimum – Updates the minimum governance tokens required to vote on a proposal on the Bema network.
setVoteDifferential - Updates the required minimum margin between "yes" and "no" votes on a governance proposal on the Bema network.
setSupportRequiredPct – Updates the minimum required percentage of "yes" votes for a governance proposal to be approved on the Bema network.
setMinimumNoticePeriodSeconds – Updates the minimum notice period required for governance proposals on the Bema network.
setQuietEndingPeriodSeconds – Updates the quiet period required for governance proposals on the Bema network.
setProposalThreshold – Updates the minimum required threshold of governance tokens to create a proposal on the Bema network.
setVotingPowerThreshold – Updates the minimum required threshold of governance tokens to be eligible to vote on a proposal on the Bema network.
createProposal – Creates a new governance proposal in the Bema network.
castVote: Cast a vote for a governance proposal on the Aud network




updateServiceTypeGasPrice: Updates the gas price for the service of the specified service type.
getServiceTypeGasPrice: Gets the gas price for the service of the specified service type.
updateDelegateOwnerWallet: Updates the delegate owner's wallet address.
getDelegateOwnerWallet: Gets the wallet address of the delegated owner.
updateDelegateExecutionThreshold - Updates the execution threshold for the delegated owner.
getDelegateExecutionThreshold: Gets the execution threshold for the delegated owner.
updateDelegateList: Updates the list of allowed addresses for the delegated owner.
getDelegateList: Gets the list of allowed addresses for the delegated owner.
addDelegates: Add addresses to the list of allowed addresses for the delegate owner.
removeDelegates: Removes addresses from the list of allowed addresses for the delegate owner.
updateGroupMetadata: Updates the metadata of the group with the specified group ID.
getGroupMetadata: Gets the metadata of the group with the specified group ID.
updateGroupAdminAddress: Updates the address of the group administrator with the specified group ID.
getGroupAdminAddress: Gets the address of the group administrator with the specified group ID.
updateGroupMetadataAddress: Updates the address of the group metadata contract with the specified group ID.
getGroupMetadataAddress: Gets the address of the group metadata contract with the specified group ID.
updateServiceTypeDelegation: Updates the permission delegation for the specified service type.
getServiceTypeDelegation: Gets the permission delegation for the specified service type.
updateMetadataDistributor: Updates the address of the metadata distributor.
getMetadataDistributor: Gets the address of the metadata distributor.
updateMetadataCreationFee: Updates the metadata creation fee.
getMetadataCreationFee: Gets the metadata creation fee.
updateMetadataMaxBlockSize: Updates the maximum metadata block size.
getMetadataMaxBlockSize: Gets the maximum block size of metadata.
updateTreasuryConfig: Updates the treasury configuration.
getTreasuryConfig: Gets the treasury configuration.
updateDisputeManagerAddress: Updates the address of the dispute management contract.
getDisputeManagerAddress: Gets the address of the dispute management contract.
updateServiceProviderFactory: Updates the service provider factory contract address.
getServiceProviderFactory: Gets the address of the service provider factory contract.
updateServiceTypeManager: Updates the address of the service type management contract.
getServiceTypeManager: Gets the address of the service type management contract.
updateStakingAddress: Updates the address of the staking contract.
getStakingAddress: Gets the address of the staking contract.
updateDelegateManagerAddress: Actual




getProviderEndpoint
setProviderEndpoint
addTrackToNode
removeTrackFromNode
setNodeOperator
removeNodeOperator
getNodeOperator
getEndpointOnHost
addNodeToCluster
removeNodeFromCluster
getCluster
setDelegateOwner
setDelegator
getDelegator
getDelegateOwner
setServiceType
getServiceType
removeServiceType
setBemaTokenAddress
getBemaTokenAddress
setStakingAddress
getStakingAddress
setDelegateManagerAddress
getDelegateManagerAddress
setTreasuryAddress
getTreasuryAddress
setGovernanceAddress
getGovernanceAddress
setProxyStorageAddress
getProxyStorageAddress
setProxyAdminAddress
getProxyAdminAddress
setServiceProviderFactoryAddress
getServiceProviderFactoryAddress
setServiceProviderRegistryAddress
getServiceProviderRegistryAddress
setDiscoveryProviderFactoryAddress
getDiscoveryProviderFactoryAddress
setDiscoveryProviderRegistryAddress
getDiscoveryProviderRegistryAddress
setStakingAddress
getStakingAddress
setServiceTypeManagerAddress
getServiceTypeManagerAddress
setRegistryLogicAddress
getRegistryLogicAddress
setGovernanceOwnerAddress
getGovernanceOwnerAddress
setGovernanceOwnerPercentage
getGovernanceOwnerPercentage
setGovernanceServiceTypePercentage
getGovernanceServiceTypePercentage
setGovernanceProviderStakePercentage
getGovernanceProviderStakePercentage
setGovernanceDelegatorStakePercentage
getGovernanceDelegatorStakePercentage
setDelegateOwnerAddress
getDelegateOwnerAddress
setDelegateOwnerPercentage
getDelegateOwnerPercentage
setDelegateServiceTypePercentage
getDelegateServiceTypePercentage
setDelegateProviderStakePercentage
getDelegateProviderStakePercentage
setDelegateDelegatorStakePercentage
getDelegateDelegatorStakePercentage
getStakingContractStakedAmount
getStakingContractTotalStakedAmount
getStakingContractDelegateAmount
getStakingContractDelegateTotalAmount
getStakingContractDelegateUnstakeAmount
getStakingContractDelegateTotalUnstakeAmount
getDelegateContractDelegateAmount
getDelegateContractDelegateTotalAmount
getDelegateContractDelegateUnstakeAmount
getDelegateContractDelegateTotalUnstakeAmount
getDelegateContractOwnerWithdrawAmount
getDelegateContractOwnerTotalWithdrawAmount
getServiceProviderFactoryOwnership
getServiceProviderFactoryTotalStaked
getServiceProviderFactoryStake
getServiceProviderRegistryOwnership
getServiceProviderRegistryStaked
getServiceProviderRegistryTotalStaked
getDiscoveryProviderFactoryOwnership
getDiscoveryProviderFactoryTotalStaked
getDiscoveryProviderFactoryStake
getDiscoveryProviderRegistryOwnership
getDiscoveryProviderRegistryStaked
getDiscoveryProviderRegistryTotalStaked
getNetworkMetadata
setNetworkMetadata
setShareOfStakingContract
getShareOfStakingContract
getNetworkMetadataUpdateTime
getNodeEndpointOwner
getNodeOwner
getEndpointNode
getDelegateOwnerWithdrawLockupEpochs
getDelegateOwnerWithdrawEpochs
getServiceTypeManagerOwner
getServiceTypeManagerAccess
setServiceTypeManagerAccess
getDelegateOwnerWithdrawAmount
getDelegateOwnerTotalWithdrawAmount
setEndpointConfiguration
getEndpointConfiguration
setProviderEndpointFee
getProviderEndpointFee
setMaxAccountAllocation






updateDelegate : Updates a user's delegate to vote on their behalf.
getStakerInfo : Returns information about a staker, including its amount staked, its delegate, the total votes it received, the total tokens earned, and the tokens available for withdrawal.
getUserLockedBalance : Returns the number of tokens a user has locked in a lock contract.
getUserLockedBalances : Returns a list of all lock contracts in which a user has tokens locked, and the number of tokens locked in each.
getTotalLockedBalance : Returns the total number of tokens locked in a lock contract.
getTotalLockedBalances : Returns a list of all lock contracts and the total number of tokens locked in each.
withdraw : Removes tokens from a lock contract.
withdrawMany : Withdraws tokens from multiple lock contracts at once.
emergencyWithdraw : Removes all tokens from a lock contract and returns the tokens to the original owner of the contract.
emergencyWithdrawMany : Withdraws all tokens from multiple lock contracts at once and returns the tokens to the original contract owners.
createOrExtendLock : Creates a new lock contract or extends the duration of an existing lock contract.
setTreasury : Sets the direction of the treasury contract.
setVotingPeriod : Sets the length of the block voting period.
setVotingQuorum : Sets the voting quorum required for a proposal to be approved.
setVotingSlateSize : Sets the maximum number of votes a user can cast on a proposal.
setRewardDistribution : Sets the direction of the reward distribution contract.
setRoundLength : Sets the length of each round in seconds.
setStakeTarget : Sets the target amount of tokens to stake in the current round.
setStakeAmount : Sets the amount of tokens a user can stake in the current round.
setRewardAmount : Sets the amount of reward tokens to be awarded in the current round.
setRewardIncreaseFactor : Sets the reward increase factor each round.
setRewardDecreaseFactor : Sets the reward decrease factor each round.
setRoundBase : Sets the base used to calculate the number of reward tokens for each round.
setTotalRounds : Sets the total number of rounds to run.
startNextRound : Starts the next round of betting and reward distribution.
finishRound : Ends the current round and distributes the rewards to the corresponding stakers.




ServiceTypeManager.sol: contract to manage the service types that Bema nodes can offer.
addType(string calldata _typeName, uint256 _stakingRequirement): adding a new type of service with a staking requirement.
editType(uint256 _typeId, string calldata _typeName, uint256 _stakingRequirement): Edit the existing service type.
deleteType(uint256 _typeId): Delete an existing service type.
getType(uint256 _typeId): Get information about an existing service type.
DelegateManager.sol: contract to manage the staking delegation in Bema.
delegate(uint256 _amount): delegate BEMA tokens to a validator.
delegated (uint256 _amount): remove BEMA tokens from delegation in a validator.
withdrawRewards(uint256 _validatorId): Withdraw rewards from a particular validator.
withdrawAllRewards() – Withdraw all rewards from delegated validators.
BemaAdminUpgradeabilityProxy.sol – Proxy for upgrading Bema contracts via an implementation contract upgrade.
upgradeTo(address newImplementation): update the implementation contract.
upgradeToAndCall(address newImplementation, bytes calldata data): update the implementation contract and call a function in the new contract.
OwnershipProxy.sol - Proxy that manages ownership of Bema contracts.
transferProxyOwnership(address newOwner): Transfer ownership of the proxy to a new address.
acceptProxyOwnership(): accept ownership of the proxy.
Upgradeable.sol: base contract for upgradeable Bema contracts.
initialize(address _sender): initialize the contract at the time of its creation.
upgradeTo(address newImplementation): update the implementation contract.
upgradeToAndCall(address newImplementation, bytes calldata data): update the implementation contract and call a function in the new contract.
IDiscoveryProvider.sol: Interface for content discovery providers on the Bema network.
getTracks(uint32 limit, uint32 offset, bytes32[] calldata trackIds): Get information about tracks on the Bema network.
getPlaylists(uint32 limit, uint32 offset, bytes32[] calldata playlistIds): Get information about playlists on the Bema network.
IVoting.sol: interface for voting contracts in the Bema network.
createPoll(string calldata _title, string calldata _metadata,uint256 _endTime, address _tokenAddress, uint256 _tokensPerVote, uint256 _minVotesRequired): create a new survey on the network.
getPoll(uint256 _pollId): Obtain information about an existing survey.
vote(uint256 _pollId, bool _support): Cast a vote in an existing poll.
finalizePoll(uint256 _pollId): End an existing poll and distribute voting tokens.
StakingConstants.sol: contract to store staking constants in Bema.
StakingData.sol: contract to store the




setServiceTypeManager(address _serviceTypeManager): Sets the direction of the contract that manages the service types.
setDiscoveryProviderFactory(address _discoveryProviderFactory): Sets the direction of the contract that manages the creation of discovery providers.
setDelegateManager(address _delegateManager): Sets the direction of the contract that manages the delegates.
setTreasury(address _treasury): establishes the direction of the treasury, which is responsible for the management of the protocol funds.
setUniswapRouter(address _uniswapRouter): Sets the address of the Uniswap router used for token swapping.
setMintableToken(address _mintableToken): Sets the address of the mintable token used by the protocol.
setStakingPoolFactory(address _stakingPoolFactory): Sets the address of the contract that manages the creation of staking pools.
setTokenServicesRegistry(address _tokenServicesRegistry): Sets the address of the token services registry used by the protocol.
setTreasuryConfig(address _treasuryConfig): Sets the direction of the contract that manages the treasury setup.
setBemaAdmin(address _BemaAdmin): Sets the address of the Bema administrator.
setPlatformWallet(address _platformWallet): Sets the address of the platform's wallet, which receives the income from the platform's services.
setProxyAdmin(address _proxyAdmin): Sets the address of the proxy manager used by the protocol.
setProxyRegistry(address _proxyRegistry): Sets the address of the proxy registry used by the protocol.
setGovernanceAddress(address _governanceAddress): Sets the direction of the governance contract used by the protocol.
setClaimDistributionFactory(address _claimDistributionFactory): Sets the direction of the contract that manages the creation of dunning distributions.
setServiceProviderFactory(address _serviceProviderFactory): sets the direction of the contract that manages the creation of service providers.
setDiscoveryProviderRegistry(address _discoveryProviderRegistry): Sets the address of the discovery provider registry used by the protocol.
setServiceTypeFactory(address _serviceTypeFactory): sets the direction of the contract that manages the creation of service types.
setDelegateOwnershipManager(address _delegateOwnershipManager): Sets the address of the contract that manages the ownership of delegates.
setStakingEscrowFactory(address _stakingEscrowFactory): Sets the contract address that manages the creation of staking escrow contracts.
setGovernanceBemaAddress(address _governanceBemaAddress): Sets the address of the BEMA token used for voting in the governance contract.
setServiceTypeManagerOwner(address _serviceTypeManagerOwner): Sets the address of the contract owner who manages the service types.
setOwnershipStaking(address _ownershipStaking): Sets the address of the staking contract used for token ownership.
setRewardsManager(address _rewardsManager): Sets the address of the contract that manages the distribution of rewards.
`




getClaimedRewardsForUser(address user) → uint256 – Returns the number of rewards a user has claimed.
getUnclaimedRewardsForUser(address user) → uint256 – Returns the amount of rewards pending to be claimed for a user.
getGlobalRewardsBalance() → uint256 – Returns the total global rewards balance.
getTotalRewardsClaimed() → uint256 – Returns the total amount of rewards claimed so far.
getTotalRewardsUnclaimed() → uint256 – Returns the total amount of rewards unclaimed.
getRewardToken() → address – Returns the address of the token used for rewards.
getRewardsManager() → address: returns the address of the contract that manages the rewards.
getRewardsDuration() → uint256 – Returns the duration of the rewards period in seconds.
getRewardsDistribution() → address: returns the address of the contract in charge of distributing rewards.
getRewardsDisbursement(uint256 index) → (uint256, uint256, uint256, uint256, bool): Returns information about a specific reward distribution.
getTotalRewardsDisbursed() → uint256 – Returns the total amount of rewards distributed so far.
isRewardsDistributionActive() → bool: returns true if reward distributions are currently active.
getTreasuryWallet() → address: returns the address of the treasury wallet.
getTreasuryBalance() → uint256 – Returns the current balance of the treasury wallet.
getTreasuryFee() → uint256 – Returns the current fee for the treasury wallet.
getTreasuryFeePercentage() → uint256 – Returns the percentage of the fee that goes to the treasury wallet.
getTreasuryFeeRecipient() → address – Returns the address of the treasury wallet fee recipient.
setTreasuryFee(uint256 fee): update the fee for the treasury wallet.
setTreasuryFeeRecipient(address recipient): Updates the recipient of the fee for the treasury wallet.
setTreasuryFeePercentage(uint256 percentage): Updates the percentage of the fee that goes to the treasury wallet.
setTreasuryWallet(address payable wallet): update the treasure wallet address.
getDelegateRegistry() → address: Returns the address of the delegate registry.
getDelegate(address stakes) → address: returns the address of the delegate for a specific bettor.
delegate(address delegate): Sets the address of the delegate for the caller calling the function.
undelegate(): Removes the delegate address for the caller.
getStakingBalance(address stakes) → uint256 – Returns the bet balance for a specific bettor.
getTotalStaked() → uint256 – Returns the total amount of tokens staked.
getStakedPercent(address stakes) → uint256 – returns the percentage of the total token supply that has been staked






removeDelegatorStake(address delegator) external: Removes stake from a delegator and updates the reward distribution of validators.
moveDelegatorStake(address delegator, uint256 amount) external: Transfer the stake from a delegator to another validator and update the reward distribution.
increaseValidatorCommissionRate(uint256 amount) external: Increases a validator's commission for delegator rewards.
decreaseValidatorCommissionRate(uint256 amount) external: Decreases a validator's commission for delegator rewards.
setDelegationParameters(uint256 minimumDelegationAmount, uint256 undelegationWaitTime) : Updates the delegation parameters, including the minimum delegation amount and the wait time to dedelegate.
setRegistryAccessManager(address manager) : Updates the registry access management contract.
setTokenAccessManager(address manager) : Updates the token access management contract.
setDelegationManager(address manager) : Updates the branch access management contract.
setRewardManager(address manager) : Update the reward access management contract.
setStakingTarget(address stakingTarget) : Updates the address of the staking contract.
setStakingTargetFactory(address factory) : Updates the staking factory contract address.
setStakingPortGovernor(address stakingPortGovernor) : Updates the staking gateway governance contract address.
setStrikeParameters(uint256 minimumStake, uint256 cobbDouglasAlphaNumerator, uint256 cobbDouglasAlphaDenominator, uint256 minimumStakingDuration, uint256 maximumStakingDuration, uint256 earlExits, uint256 stakingEpochDuration, uint256 unstakingEpochDuration) : Updates staking parameters, including minimum stake amount, Cobb-Douglas parameters, minimum and maximum staking duration, early exit time, staking epoch duration, and unstaking epoch duration.
setContractAddresses(address registryAddress, address tokenAddress, address delegationAddress, address rewardAddress, address stakingTargetAddress, address stakingTargetFactoryAddress, address stakingPortGovernorAddress) : Updates the addresses of the main contracts.
setOwner(address newOwner) : Transfers ownership of the governance contract to a new address.
setInitializationComplete() external onlyGovernance : Marks the governance contract as fully initialized after all main contracts have been initialized.
setDelegateManager(address manager) : Updates the delegate access management contract.
setDelegationParameters(address delegator, uint256 minimumDelegationAmount, uint256 undelegationWaitTime) : Updates the delegation parameters for a specific delegator.
setRewardsManager(address manager) : Update the reward access management contract.
setTreasury(address _treasury) : Update the address of the treasury to receive the commissions




setDiscoveryProviderWhitelist: Sets a white list of discovery providers that can be used on the platform.
setFactory – Sets a new address for the factory contract.
setRegistry – Sets a new address for the registry contract.
setDiscoveryProviderFactory – Sets a new address for the discovery provider factory contract.
setGovernance – Sets a new direction for the governance contract.
setServiceTypeManager – Sets a new address for the service type management contract.
setDelegateOwner – Sets a new address for the delegate owner.
setServiceTypeManagerOwner – Sets a new address for the owner of the service type management contract.
updateDelegateApprovals – Updates the delegated owner approvals for a specific set of contracts.
getProposer – Gets the proposer from a set of specific proposal parameters.
checkProposalCode – Checks if the source code of a proposal compiles correctly.
createServiceType – Creates a new service type.
editServiceType – Edit an existing service type.
deleteServiceType – Deletes an existing service type.
createService – Create a new service.
editService – Edit an existing service.
deleteService – Deletes an existing service.
registerUserReplicaSet – Registers a user replica set for a specific user.
deregisterUserReplicaSet: deletes a set of user replicas for a specific user.
migrateFrom – migrates tokens from a legacy contract.
setAccountingEngine – Sets a new address for the accounting engine contract.




Staking.sol: BEMA token staking contract.
stake: Function that allows the user to stake their BEMA tokens in the contract.
unstake: Function that allows the user to withdraw their staked tokens from the contract.
collectRewards: Function that allows the user to collect the rewards obtained by staking their tokens.
GovernanceVoting.sol: Contract that manages community voting.
createProposal: Function that allows the user to create a governance proposal.
cancelProposal: Function that allows the user to cancel a previously created governance proposal.
castVote: Function that allows the user to cast their vote for or against a governance proposal.
revokeVote: Function that allows the user to revoke their previously cast vote.
LockedFala.sol: Contract that manages the blocking of FALA tokens.
lock: Function that allows the user to lock their FALA tokens.
unlock: Function that allows the user to unlock their previously locked FALA tokens.
relock: Function that allows the user to re-lock their previously unlocked FALA tokens.
ProxyStorage.sol: Contract that stores the addresses of the platform contracts.
getContract: Function that allows obtaining the address of a contract from the platform.
DelegateRegistry.sol: Contract that handles the delegation of user votes.
delegate: Function that allows the user to delegate their voting rights to another user.
undelegate: Function that allows the user to undo the delegation previously made.
getDelegate: Function that allows obtaining the address of the user to whom the right to vote has been delegated.
DiscoveryProvider.sol: Contract that manages the provision of content discovery services.
registerProvider: Function that allows a content provider to register on the platform.
deregisterProvider: Function that allows a content provider to unsubscribe from the platform.
updateEndpoint: Function that allows the content provider to update the address of its endpoint.
ServiceTypeManager.sol: Contract that handles the management of types of services offered on the platform.
addServiceType: Function that allows a content provider to add a type of service to the platform.
removeServiceType: Function that allows a content provider to remove a type of service previously added.
DelegateManager.sol: Contract that handles the management of platform delegates.
addDelegate: Function that allows a content provider to add a delegate to the platform.
removeDelegate: Function that allows a content provider to remove a previously added delegate.
ServiceTypeManager.sol: Contract that handles the management of types of services offered on the platform.
addServiceType: Function that allows a content provider to add a type of






addDelegate
removeDelegate
delegate
delegateBySig
addDelegateByOwner
removeDelegateByOwner
proposalState
proposalCount
submitVote
submitVoteBySig
submitVoteByDelegate
submitVoteByDelegateBySig
processProposal
processProposalBatch
cancelProposal
cancelProposalBatch
createCommunity
addAdminRole
removeAdminRole
addMinterRole
removeMinterRole
transferOwnership
acceptOwnership
updateConfigValue
updateConfigAddress
getGovernanceInfo
isAllowedExternalContract
addToAllowedExternalContracts
removeFromAllowedExternalContracts
setTokenTransferFee
setStakeTarget
setStakeAmount
setMyStakeTime
setMaxStakeTime
updateTimelockAdmin
It should be noted that some of these functions are specific to the use of the Bema (BEMA) token and its staking, while others are related to the management of the Bema platform in general.


An enhancement request for smart contract documentation.
An issue with the content creator registration feature in the Bema app.
An issue with updating the governance contract address in the node registry contract.
An issue with the storage of certain state values ​​in the content service contract.
It's important to note that some of these issues may have been fixed as of the time this answer was written. If you are interested in auditing contract security, it is important to review current code and open issues to ensure that no new issues or vulnerabilities have been found since the last review.

```



