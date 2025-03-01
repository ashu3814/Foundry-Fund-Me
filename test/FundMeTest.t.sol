// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test , console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    function setUp() external {
     fundMe = new FundMe();
    }

    function testMinimumDollarIsFive() external view {
        assert(fundMe.MINIMUM_USD() == 5e18);
    }

    function testOwnerIsMegSender() public view {
        assert(fundMe.i_owner() == address(this));
    }

}