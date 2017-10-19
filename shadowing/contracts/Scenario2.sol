pragma solidity ^0.4.15;

/**
 * See: https://solidity.readthedocs.io/en/develop/contracts.html#multiple-inheritance-and-linearization
 */

contract A2 {
    uint256 public variable;

    function A2() {
        variable = 1;
    }

    function getA2Variable()
    constant
    external
    returns (uint256)
    {
        return variable;
    }
}

contract B2 is A2 {
    uint256 public variable;

    function B2() {
        variable = 2;
    }

    function getB2Variable()
        constant
        external
        returns (uint256)
    {
        return variable;
    }
}

// what does variable() refer to?
// which variable does C2 use? A2 or B2?
contract C2 is A2, B2 {
    function C2() {
        variable = 3;
    }
}