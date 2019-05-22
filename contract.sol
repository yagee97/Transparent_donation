```
pragma solidity ^0.4.4;

contract Donation {
    // contract admin address
    address public owner;
    
    // struct payee info
    struct Payee {
        // status of payee
        bool status;
        // total weight
        uint weight;
        // the amount held for the payee
        uint balance;
    }
    
    // mapping
    mapping(address => Payee) public payees;
    mapping(int8 => address) public payeesIndex;
    int8 public payeesIndexSize;
    
    // event
    event NewDonation(address indexed donator, uint amt);
    event Transfer(address indexed from, address indexed to, uint amt);
    event PayeeAction(address indexed payee, bytes32 action);
    event Withdrawal(address indexed payee, uint amt);
    event OwnerChanged(address indexed owner, address indexed newOwner);
    event ContractDestroyed(address indexed contractAddress);
        
    // constructor    
    function Donation() {
        // set the address of the contract deployer to be owner
        owner = msg.sender;
        payees[owner].status = true;
        payees[owner].weight = 10;
        payeesIndex[0] = owner;
        payeesIndexSize = 1;
    }
    
    // modifier
    modifier isOwner() {
        // check current account is owner
        if(msg.sender != owner) throw;
        _;
    }
    
    modifier isPayee() {
        // check current calling methods is valicd payee of the contract
        if(payees[msg.sender].status != true) throw;
        _;
    }
    
    //Aggregate all payee weights
    function getTotalWeight() private returns (uint) {
        int8 i;
        uint totalWeight = 0;
        
        for(i = 0; i<payeesIndexSize; i++) {
            if(payees[payeesIndex[i]].status == true) {
                totalWeight += payees[payeesIndex[i]].weight;
            }
        }
    }
    
    // function which  will accept donations
    function deposit() payable {
        if(msg.value == 0) throw;
        int8 i;
        uint totalWeight = 0;
        
        totalWeight = getTotalWeight();
        for(i = 0; i<payeesIndexSize; i++) {
            if(payees[payeesIndex[i]].status == true) {
                uint divisor = (totalWeight / payees[payeesIndex[i]].weight);
                payees[payeesIndex[i]].balance = msg.value / divisor;
            }
        }
        
        NewDonation(msg.sender, msg.value);    
    }   
    
    // add a new payee to the contract
    function addPayee(address _payee, uint _weight) isOwner returns (bool) {
        payees[_payee].weight = _weight;
        payees[_payee].status = true;
        payeesIndex[payeesIndexSize] = _payee;
        payeesIndexSize++;
        
        PayeeAction(_payee, 'added');
    }
    
    //Amend payee weight
    function updatePayeeWeight(address _payee, uint _weight) isOwner {
        payees[_payee].weight = _weight;
    }
    
    // disallow account address from acting on contract
    function disablePayee(address _payee) isOwner returns (bool) {
        // owner account do not lock out
        if(_payee == owner) throw;
        
        payees[_payee].status = false;
        PayeeAction(_payee, 'disabled');
    }
    
    // allow account address from acting on contract    
    function enablePayee(address _address) isOwner {
        payees[_address].status = true;
        PayeeAction(_address, 'enabled');
    }
    
    // allow payee to withdraw
    function withdraw(uint amount) payable isPayee {
        if(payees[msg.sender].status != true || amount > payees[msg.sender].balance) throw;
        if(msg.sender.send(amount)) throw;
        Withdrawal(msg.sender, amount);
        payees[msg.sender].balance -= amount;
    }
    
    //transfer some Ether available to withdraw to another
    function transferBalance(address _from, address _to, uint amount) isOwner {
          if(payees[_from].balance < amount) throw;
          payees[_from].balance -= amount;
          payees[_to].balance += amount;
          Transfer(_from, _to, amount);
    }
    
    function getBalance(address _address) isPayee returns(uint) {
        return payees[_address].balance;
    }
    
    function getWeight(address _address) isPayee returns(uint) {
        return payees[_address].weight;
    }
    
    function getStatus(address _address) returns(bool) {
        return payees[_address].status;
        
    }
    
    // change the owner of the contract
    function transferOwner(address newOwner) isOwner returns(bool) {
        if(!payees[newOwner].status == true) throw;
        OwnerChanged(owner, newOwner);
        owner = newOwner;
    }
    
    //destroy the contract
    function killContract() payable isOwner {
        int8 i;
        address payee;
        
        for(i = 0; i<payeesIndexSize; i++){
            payee = payeesIndex[i];
            if(payees[payee].balance > 0) {
                if(payee.send(payees[payee].balance)){
                    Withdrawal(payee, payees[payee].balance);
                }
            }
        }
        
        ContractDestroyed(this);
        selfdestruct(owner);
    }
}
```
