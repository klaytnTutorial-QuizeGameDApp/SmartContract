pragma solidity ^0.4.24;

import "./ERC721/ERC721.sol";
import "./ERC721/ERC721Enumerable.sol";

contract QuizKing is ERC721, ERC721Enumerable {
    //event log
    event quizCreated();
    //struct
    struct QuizData {
        bytes32 quizId; // 퀴즈 아이디
        address creator; // 퀴즈 생성자
        string quizContent; // 문제 
        bytes32[4] answerList; // 문제 보기
        uint8 answer; // 정답
        address winner; // 문제를 푼 사람
        bool isDone; // 문제의 해결 여부
        uint256 prize; //문제 보상 klay
    }

    mapping( bytes32 => QuizData ) public quizDataSet;
    struct UserData {
        uint win;
        uint lose;
    }
    mapping( address => UserData ) public record;


    //constructor
    constructor() public {
        owner = msg.sender;
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