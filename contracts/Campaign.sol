pragma solidity >=0.4.0 <0.7.0;
//anyone should be able to make contract using this factory  and he becomes manager

// this.projectData[index].contract.methods.getRefund().send({
//     from: this.account,  , this this.account would be the sender of the message
//   })
//sending money is done to the contract address.    The frontend will have the address for it.
import "./Console.sol";


contract Campaign {
    //actually manager and recipient are the same here.
    string public description;
    uint256 public value;
    address payable recipient;
    bool public complete;
    uint256 public minimumContribution;
    mapping(address => bool) public approvers;
    mapping(address => uint256) public contributions;
    uint256 public approversCount;
    uint256 deadline;
    uint256 public total = 0;
    uint256 curtime;
    modifier restricted() {
        require(msg.sender == recipient, "not equal");
        _; //super imp
    }

    constructor(
        uint256 minimum,
        string memory desc,
        uint256 val,
        address payable reci,
        uint256 last
    ) public {
        minimumContribution = minimum;
        description = desc;
        value = val;
        recipient = reci;
        deadline = last;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    //ether is put into a contract, whenever account calls this function
    function contribute() public payable {
        require(
            msg.value > minimumContribution,
            "You do not meet the minimum contribution"
        );

        if (approvers[msg.sender]) {
            contributions[msg.sender] = contributions[msg.sender] + msg.value;
        } else {
            approvers[msg.sender] = true;
            contributions[msg.sender] = msg.value;
            approversCount++;
        }
        total = total + msg.value;
        finalize(); //check after each contribution
    }

    //This function is called by the person who earlier contributed to this campaign
    // function getRefund() public returns (bool) {
    //     require(contributions[msg.sender] > 0 ,"You have 0 contributions to this campaign");
    //     uint refund = contributions[msg.sender];    //whosoever called this function using from: attribute
    //     contributions[msg.sender] = 0;

    //     if(msg.sender.send(refund) ){
    //         return true;
    //     }
    //     else{   //if the transaction failed for some reason
    //         contributions[msg.sender] = refund;
    //         return false;
    //     }
    // }

    //from contract to actual recipient
    function finalize() public {
        if (total >= value) {
            complete = true;
            //goes from contract to recipient
            recipient.transfer(total);
            return;
        } else {
            //if time exceeded
        }
    }

    function getDeadline() public view returns (uint256) {
        return deadline;
    }

    function getDescription() public view returns (string memory) {
        return description;
    }

    function getTotal() public view returns (uint256) {
        return total;
    }
}
