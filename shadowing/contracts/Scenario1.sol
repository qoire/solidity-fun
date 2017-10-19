pragma solidity ^0.4.15;

contract A1 {
    uint256 public variable;

    function A1() {
        variable = 1;
    }

    function getVariable()
        constant
        external
        returns (uint256)
    {
        return variable;
    }
}

contract B1 is A1 {
    uint256 public variable;

    function B1() {
        variable = 2;
    }
}

contract C1 is B1 {
    /**
     * What happens when we call variable(), getVariable()?
     */
}