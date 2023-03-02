// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface IChaiPassEndpoint {
    /// @notice This function is responsible for sending messages to destination chain
    /// @param _routeId Id of route
    /// @param _nonce nonce
    /// @param _destinationAddress Address of destination contract to send message on
    /// @param _destinationChainId chain id of destination chain
    /// @param _payload Address of destination contract to send message on
    function sendMessage(
        string calldata _routeId,
        uint256 _nonce,
        address _destinationAddress,
        uint256 _destinationChainId,
        bytes calldata _payload
    ) external payable;
}
