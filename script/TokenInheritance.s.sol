// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console2} from "forge-std/Script.sol";
import {Ownable} from "../src/TokenInheritance.sol";
import {Pausable} from "../src/TokenInheritance.sol";
import {Token} from "../src/TokenInheritance.sol";

contract TokenInheritanceScript is Script {
    Ownable public ownable;
    Pausable public pausable;
    Token public token;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        ownable = new Ownable();
        pausable = new Pausable();
        token = new Token();
        vm.stopBroadcast();
    }
}
