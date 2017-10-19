pragma solidity ^0.4.15;

/**
 * This one is based on:
 * https://pdaian.com/blog/solidity-anti-patterns-fun-with-inheritance-dag-abuse/
 * 
 * Solidity inheritance leads to non-intuitive behaviour
 * 
 *          Top
 *         /   \
 *        /     \
 *       /       \
 *      Left    Right
 *       \       /
 *        \     /
 *         \   /
 *         Bottom
 */

contract Top {
    function getNumber()
        constant
        returns (uint256)
    {
            return 1;
    }
}

/**
 * The intent of Left is to print the inheritance of the current
 * structure, expected to be:
 * "Top -> Left";
 */
contract Left is Top {
    function getNumber()
        constant
        returns (uint256)
    {
        uint256 parent = super.getNumber();
        return parent + 1;
    }
}

/**
 * The intent of Right is to print the inheritance of the current
 * structure, expected to be:
 * "Top -> Right";
 */
contract Right is Top {
    function getNumber()
        constant
        returns (uint256)
    {
        uint256 parent = super.getNumber();
        return parent + 1;
    }
}

contract Bottom is Left, Right {
    // whats printed here?
    // is it "Top -> Right -> Bottom"?
    function getNumber()
        constant
        returns (uint256)
    {
        uint256 parent = super.getNumber();
        return parent + 1;
    }
}