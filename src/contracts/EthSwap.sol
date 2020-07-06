pragma solidity ^0.5.0;

import "./Token.sol";

contract EthSwap {
    // code for Smart Contract
    string public name = "EthSwap Instant Exchange"; //State variable(stored in blockchain)
    Token public token; //variable representing the Token Smart Contract
    uint256 public rate = 100; //Can't be a decimal

    event TokenPurchased(
        address account,
        address token,
        uint256 amount,
        uint256 rate
    );

    constructor(Token _token) public {
        token = _token;
    }

    function buyTokens() public payable {
        //Amount of Ethereum * Redemption Rate
        // 1 Eth = 100 DApp
        uint256 tokenAmount = msg.value * rate;
        token.transfer(msg.sender, tokenAmount); //msg global variable in solidity.
        // Emit an Event
        emit TokenPurchased(msg.sender, address(token), tokenAmount, rate);
    }
}
