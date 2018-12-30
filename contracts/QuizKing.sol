pragma solidity ^0.4.24;

import "./ERC721/ERC721.sol";
import "./ERC721/ERC721Enumerable.sol";

contract QuizKing is ERC721, ERC721Enumerable {
    //event log

    //struct
    struct QuizData {
        bytes32 id;
        address author;
        string problem;
        string answer;
        uint challenger;
        bool isFinish;
    }

    //function
    function createQuiz(string message) public{
        bytes32 id = keccak256(abi.encodePacked(block.number, msg.sender, message));

    }

    function applyQuiz() {

    }

    function checkAnswer() {

    }

    function payPrize() {
        
    }

}