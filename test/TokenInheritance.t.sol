// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console2} from "forge-std/Test.sol";
import {Ownable} from "../src/TokenInheritance.sol";
import {Pausable} from "../src/TokenInheritance.sol";
import {Token} from "../src/TokenInheritance.sol";

contract OwnableTest is Test {
    Ownable public ownable;

    function setUp() public {
        ownable = new Ownable();
    }

    function test_DeployOwnableContract() public {
        assertEq(ownable.owner(), address(this));
    }
}

contract PausableTest is Test {
    Pausable public pausable;

    function setUp() public {
        pausable = new Pausable();
    }

    function test_CallPauseFunction() public {
        pausable.pause();
        assertEq(pausable.paused(), true);
    }

    function test_CallUnpauseFunction() public {
        pausable.unpause();
        assertEq(pausable.paused(), false);
    }
}

contract TokenTest is Test {
    Token public token;
    Pausable public pausable;

    function setUp() public {
        pausable = new Pausable();
        token = new Token();
    }

    function test_DeployTokenContract() public {
        assertEq(token.balances(address(this)), 0);
    }

    function test_MintToken() public {
        token.mint();
        assertEq(token.balances(address(this)), 1000);
    }

    function test_TransferToken() public {
        address alex = address(0x123);

        token.mint();

        uint256 initialOwnerBalance = token.balances(address(this));
        uint256 initialTargetBalance = token.balances(alex);

        token.transfer(alex, 100);

        uint256 afterOwnerBalance = token.balances(address(this));
        uint256 afterTargetBalance = token.balances(alex);

        assertEq(initialOwnerBalance, 1000);
        assertEq(initialTargetBalance, 0);
        assertEq(afterOwnerBalance, initialOwnerBalance - afterTargetBalance);
        assertEq(afterTargetBalance, initialTargetBalance + afterTargetBalance);
    }

    function test_ErrorMintToken() public {
        vm.startPrank(address(0x123));
        vm.expectRevert(bytes("Only the owner can call this function"));
        token.mint();
    }

    function test_ErrorInsufficientBalance() public {
        vm.expectRevert(bytes("Insufficient balance"));
        token.transfer(address(0x123), 10000);
    }
}
