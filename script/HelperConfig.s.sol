// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";

import {MockV3Aggregator} from "../test/mocks/MockV3Aggregator.sol";

contract HelperConfig is Script {

    NetworkConfig public activeNetworkConfig;
    MockV3Aggregator mockPriceFeed;

    struct NetworkConfig {
        address priceFeed;
    }
    constructor(){
        if(block.chainid == 11155111){
            activeNetworkConfig = getSepoliaEathConfig();
        }else if(block.chainid == 1 ){
            activeNetworkConfig = getMianetEathConfig();
        }else{
            activeNetworkConfig = getAnvilEthConfig();
        }
    }

    function getSepoliaEathConfig() public pure returns (NetworkConfig memory){
        //price feed address
        NetworkConfig memory sepoliaConfig = NetworkConfig({priceFeed:0x694AA1769357215DE4FAC081bf1f309aDC325306 });

        return sepoliaConfig;
    }

    function getMianetEathConfig() public pure returns (NetworkConfig memory){
        //price feed address
        NetworkConfig memory sepoliaConfig = NetworkConfig({priceFeed:0x694AA1769357215DE4FAC081bf1f309aDC325306 });

        return sepoliaConfig;
    }

    function getAnvilEthConfig() public returns (NetworkConfig memory) {
        // Mock price feed address for Anvil (you may use a placeholder)
        vm.startBroadcast();
        mockPriceFeed = new MockV3Aggregator(8, 2000e8);
        vm.stopBroadcast();

        NetworkConfig memory anvilConfig = NetworkConfig({
        priceFeed: address(mockPriceFeed)
    });

    return anvilConfig;
        
    }

}

