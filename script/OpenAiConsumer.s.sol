// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import {Script} from "forge-std/Script.sol";
import {OpenAiConsumer}from "../src/OpenAiConsumer.sol";
contract OpenAiConsumers is Script{
    function run() external returns (OpenAiConsumer){
        vm.startBroadcast();
        OpenAiConsumer openAiConsumer = new OpenAiConsumer();
        vm.stopBroadcast();
        return openAiConsumer;
    }
}