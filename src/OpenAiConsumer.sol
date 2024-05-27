// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/Ownable.sol";

contract OpenAiConsumer  {
     error OwnableUnauthorizedAccount(address account);
    string public latestResponse;
    string public prompt="hello,gpt";
    event RequestSent(bytes32 requestId, string prompt);
    event ResponseReceived(bytes32 requestId, string response);
    
    function sendRequest() public returns (bytes32 requestId) {
        requestId = keccak256(abi.encodePacked(block.timestamp, msg.sender, prompt));
        emit RequestSent(requestId, prompt);
        return requestId;
    }

    function fulfillRequest(bytes32 requestId, string calldata response) public {
        latestResponse = response;
        emit ResponseReceived(requestId, response);
    }
    function showResponse()public view returns(string memory){
        return latestResponse;
    }
}
