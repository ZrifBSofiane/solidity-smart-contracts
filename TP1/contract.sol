pragma solidity ^0.4.0;
contract VoteContract {
    
    address public owner;
    uint public numerTotalVote; 
  
    uint restaurant = 1765669;
    
    
    struct Vote {
        uint vote;
        address voterAdress;
        string comment;
    }
    
    Vote[] public voters;
    
    
     modifier isRealChoice(uint vote) {
        if(vote > 6) throw;
        _;
    }
    
   modifier isowner(){
       if(msg.sender!=owner){throw;
       _;
       }
   }
    
    function VoteContract() {
        owner = msg.sender;
    }
    
    function PostVote (string OneComment,uint voteChoice) public isRealChoice(voteChoice)  {
        voters.push( Vote({
                    voterAdress : msg.sender,
                    vote : voteChoice,
                    comment : OneComment
                        })
                    );
        uint numberVote = 0;
        for(uint i = 0 ;i < voters.length; i++)
        {
            if(voters[i].vote == voteChoice)
            {
                numberVote++;
            }
        }
        numerTotalVote = numberVote;

    }
   
       function kill() isowner(){
           delete owner;
           delete restaurant;
           selfdestruct(msg.sender);
       }
   }
