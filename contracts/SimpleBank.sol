pragma solidity ^0.4.13;
contract SimpleBank {

    /* Fill in the keyword. Hint: We want to protect our users balance from other contracts*/
    mapping (address => uint) internal balances;

    /* Fill in the keyword. We want to create a getter function and allow contracts to be able to see if a user is enrolled.  */
    mapping (address => bool) public enrolled;

    /* Let's make sure everyone knows who owns the bank. Use the appropriate keyword for this*/
    address public owner;

    // Events - publicize actions to external listeners

    /* Add an argument for this event, an accountAddress */
    event LogEnrolled(address accountAddress);

    /* Add 2 arguments for this event, an accountAddress and an amount */
    event LogDepositMade(address accountAddress, uint amount);

    /* Create an event called LogWithdrawal */
    /* Add 3 arguments for this event, an accountAddress, withdrawAmount and a newBalance */
    event LogWithdrawal(address accountAddress, uint withdrawAmount, uint newBalance);

    // Constructor, can receive one or many variables here; only one allowed
    constructor() {
        /* Set the owner to the creator of this contract */
        owner = msg.sender;
    }

    /// @notice Enroll a customer with the bank
    /// @return The users enrolled status
    // Log the appropriate event
    /// @dev You can only enroll yourself
    function enroll(address _newCustomer) public returns (bool){
        if (_newCustomer = msg.sender) {
          enrolled(_newCustomer) = true;
          emit LogEnrolled(_newCustomer);
          return true;
        }
    }

    /// @notice Deposit ether into bank
    /// @return The balance of the user after the deposit is made
    // Add the appropriate keyword so that this function can receive ether
    /// @dev Note that any user can deposit money to anyone's account as long as the receiver is enrolled
    function deposit(_address) public payable returns (uint) {
        /* Add the amount to the user's balance, call the event associated with a deposit,
          then return the balance of the user */
        if (enrolled(_address) = true) {
          balances(_address) = balances(_address) + msg.value;
          emit LogDepositMade(_address, msg.value);
          return balances(_address);
        }
    }

    /// @notice Withdraw ether from bank
    /// @dev This does not return any excess ether sent to it
    /// @param withdrawAmount amount you want to withdraw
    /// @return The balance remaining for the user
    function withdraw(uint withdrawAmount) public returns (uint) {
        /* If the sender's balance is at least the amount they want to withdraw,
           Subtract the amount from the sender's balance, and try to send that amount of ether
           to the user attempting to withdraw. IF the send fails, add the amount back to the user's balance
           return the user's balance.*/
    }

    /// @notice Get balance
    /// @return The balance of the user
    // A SPECIAL KEYWORD prevents function from editing state variables;
    // allows function to run locally/off blockchain
    function balance() public returns (uint) {
        /* Get the balance of the sender of this transaction */
    }

    // Fallback function - Called if other functions don't match call or
    // sent ether without data
    // Typically, called when invalid data is sent
    // Added so ether sent to this contract is reverted if the contract fails
    // otherwise, the sender's money is transferred to contract
    function() {
        revert();
    }
}
