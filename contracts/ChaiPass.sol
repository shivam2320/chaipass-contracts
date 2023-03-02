// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./IChaiPassEndpoint.sol";

contract ChaiPass is IChaiPassEndpoint {
    error InvalidAddress();

    event SendMessage(
        string _routeId,
        uint256 _nonce,
        address _destinationAddress,
        uint256 _destinationChainId,
        bytes _payload
    );

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
    ) external payable {
        if (_destinationAddress == address(0)) revert InvalidAddress();
        emit SendMessage(
            _routeId,
            _nonce,
            _destinationAddress,
            _destinationChainId,
            _payload
        );
    }
}
