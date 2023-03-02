// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./IChainPass.sol";

contract ChaiPass is IChainPass {
    error InvalidAddress();

    event SendMessage(
        string _routeId,
        uint256 _nonce,
        address _destinationAddress,
        uint256 _destinationChainId,
        bytes _payload
    );

    event ReceiveMessage(
        uint16 _srcChainId,
        address _from,
        uint64 _nonce,
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

    /// @notice This function is responsible for receiving messages on destination chain
    /// @param _srcChainId Source chain Id
    /// @param _from Source chain contract address
    /// @param _nonce nonce
    /// @param _payload Encoded data received from source chain
    function receiveMessage(
        uint16 _srcChainId,
        address _from,
        uint64 _nonce,
        bytes calldata _payload
    ) external {
        emit ReceiveMessage(_srcChainId, _from, _nonce, _payload);
    }
}
