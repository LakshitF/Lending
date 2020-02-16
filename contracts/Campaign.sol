pragma solidity ^0.6.1;
//anyone should be able to make contract using this factory  and he becomes manager

// this.projectData[index].contract.methods.getRefund().send({
//     from: this.account,  , this this.account would be the sender of the message
//   })
//sending money is done to the contract address.    The frontend will have the address for it.

contract Campaign {
    //actually manager and recipient are the same here.
    string public description;
    uint value;
    address payable recipient;
    bool complete;
    uint public minimumContribution;
    mapping(address => bool) public approvers;
    mapping(address => uint) public contributions;
    uint public approversCount;
    uint deadline;
    uint total=0;
    uint curtime;
    modifier restricted(){
        require(msg.sender == recipient,"not equal");
        _;  //super imp
    }


    constructor (uint minimum,string memory desc,uint val,address payable reci,uint last) public {
        minimumContribution = minimum;
        description = desc;
        value = val;
        recipient = reci;
        deadline = last;
    }

    function contribute() payable public {
        require(msg.value > minimumContribution,"You do not meet the minimum contribution");
        //this contract has automatically received the intended amount from where it was called.
        if(approvers[msg.sender]){
            contributions[msg.sender] = contributions[msg.sender] + msg.value;
        }
        else{
            approvers[msg.sender] = true;
            contributions[msg.sender] = msg.value;
            approversCount++;
        }
        finalize(); //check after each contribution
    }

    //This function is called by the person who earlier contributed to this campaign
    function getRefund() public returns (bool) {
        require(contributions[msg.sender] > 0 ,"You have 0 contributions to this campaign");
        uint refund = contributions[msg.sender];    //whosoever called this function using from: attribute
        contributions[msg.sender] = 0;

        if(msg.sender.send(refund) ){
            return true;
        }
        else{   //if the transaction failed for some reason
            contributions[msg.sender] = refund;
            return false;
        }
    }

    function finalize() public{

        if(total>=value){
            complete = true;
            //goes from contract to recipient
            recipient.transfer(total);
            return;
        }
        else{
            require(1==1,"Does not have sufficient funds yet");
            //if time exceeded
        }
    }
    
    function getDeadline() public view returns (uint){
        return deadline;
    }

    function getDescription() public view returns (string memory){
        return description;
    }



}

