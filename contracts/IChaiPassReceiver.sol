// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface IChainPassReceiver {
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
    ) external;
}
