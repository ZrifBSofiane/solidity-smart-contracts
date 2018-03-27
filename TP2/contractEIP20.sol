pragma solidity ^0.4.18;

import './EIP20Interface.sol';


contract MegaToken is EIP20Interface {
    
    
    
    uint public constant total = 999999999999;
    
    
    
    
    mapping(address=>uint256) balances;
    mapping(address=>mapping(address=>uint256)) allowed;
    
    function MegaToken (uint _end, uint _amountToRaise)public{
        balances[msg.sender]= total;
    }    
    
    function totalSupply() public constant returns (uint256 totalSupply){
        return total;
    }
    
    function balanceOf(address _owner) public view returns (uint256 balance){
        return balances[_owner];
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success){
        require(
            balances[msg.sender] >= _value
            && _value>0
            );
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender,_to,_value);
        return true;
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(
            allowed[_from][msg.sender]>=_value
            &&balances[_from]>=_value
            &&_value>0
            );
        balances[_from]=balances[_from].sub(_value);
        balances[_to]=balances[_to].add(_value);
        allowed[_from][msg.sender]=allowed[_from][msg.sender].sub(_value);
        Transfer(_from,_to,_value);
        return true;
    }
    
    function approve(address _spender, uint256 _value) public returns (bool success){
        allowed[msg.sender][_spender]=_value;
        Approval(msg.sender,_spender,_value);
        return true;
        
    }
    
    function allowance(address _owner, address _spender) public view returns (uint256 remaining){
        return allowed[_owner][_spender];
    }
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value); 
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    

}