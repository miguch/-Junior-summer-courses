pragma solidity ^0.4.18;


contract show {
    
    function showAddr() public view returns (address) {
        return msg.sender;
    }
}
