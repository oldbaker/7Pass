pragma solidity ^0.4.18; 

/**
* @title ERC20 interface 
* @dev Refer https://github.com/ethereum/EIPs/issues/20
* @dev Refer https://github.com/ethereum/EIPs/issues/179
*/

contract ERC20 {
  function totalSupply()public view returns (uint256); // Refer https://github.com/OpenZeppelin/zeppelin-solidity/issues/434

  function allowance(address owner, address spender)public view returns (uint256);
  function balanceOf(address who)public view returns (uint256);
  
  function approve(address spender, uint256 value)public returns (bool success);
  function transfer(address to, uint256 value)public returns (bool success);
  function transferFrom(address from, address to, uint256 value)public returns (bool success);
  
  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value); 
}

/**
* @title SafeMath
* @dev Math operations with safety checks that throw on error
*/
contract SafeMath {
  /**
  * @dev Multiplies two numbers, throws on overflow
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a==0) {
      return 0;
    }
    uint256 c = a * b;
    assert(a == 0 || c/a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient
  */
  function div(uint256 a,uint256 b) internal pure returns (uint256) {
    // assert(b>0) // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  /**
  * @dev Substracts two numbers, throws on overflow(i.e, if subtrahend is greater than minuend)
  */
  function safeSub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow
  */
  function safeAdd(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a && c >= b);
    return c;
  }
  
  /**
  * @ title Utils
  * @dev Helper functions and extensions
  */
  function assert(bool assertion) internal {
    if (!assertion) {
      revert();
    }
  }
}