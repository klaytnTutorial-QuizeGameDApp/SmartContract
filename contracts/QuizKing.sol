pragma solidity ^0.4.24;

import "./ERC721/ERC721.sol";
import "./ERC721/ERC721Enumerable.sol";

contract QuizKing is ERC721, ERC721Enumerable {
    //event log
    event QuizCreated(bytes32 indexed quizId, address indexed creator, uint256 quizPrize, string quizContent);

    //struct
    //quiz에 대한 정보들을 담고있는 struct
    struct QuizData {
        bytes32 quizId;                 // 퀴즈 아이디
        address creator;                // 퀴즈 생성자
        string quizContent;             // 문제 
        bytes32[4] answerList;          // 문제 보기
        uint8 answer;                   // 정답
        address winner;                 // 문제를 푼 사람
        bool isDone;                    // 문제의 해결 여부
        uint256 challengerCount;        // 문제에 도전한 사람 수           
        uint256 prize;                  // 문제 보상 klay
    }
    
    // 사용자의 전적을 보여주기 위해 userData struct로 관리
    struct UserData {
        uint win;                       // 문제를 풀어서 성공한 횟수
        uint lose;                      // 문제를 풀어서 실패한 횟수
    }
    uint256 totalQuizCount;
    mapping( bytes32 => QuizData ) public quizDataSet;
    mapping( address => UserData ) public record;


    //constructor
    constructor() public {
        owner = msg.sender;
    }

    //퀴즈 생성하는 함수
    function createQuiz(string quizContent, bytes32[4] answerList, uint8 answer) public payable {
        require(msg.value > 0)
        // bytes32 id = keccak256(abi.encodePacked(block.number, msg.sender, prizeCost));
        // uint quizId = totalQuizCount;
        QuizeData newQuizData = QuizData({
            quizId : totalQuizCount,
            creator : msg.sender,
            quizContent : quizContent,
            answerList : answerList,
            answer : answer,
            prize : msg.value
        });

        totalQuizCount ++;
        emit QuizCreated(quizId, msg.sender, msg.value, quizContent);
    }

    function applyQuiz(bytes32 quizId) {

    }

    function checkAnswer(bytes32 quizId) {

    }

    function payPrize(bytes32 quizId) {
        
    }

    function getQuiz(bytes32 quizId) public view
    returns(bytes32, string, bytes32, bool, uint256) {
        require(quizeDataSet[quizId].quizId != 0, "Quiz Does Not Exist!");
        return (
            quizeDataSet[quizId].quizId,
            quizeDataSet[quizId].quizContent,
            quizeDataSet[quizId].answerList,
            quizeDataSet[quizId].isDone,
            quizeDataSet[quizId].prize
        );
    }

    function getTotalQuizCount() public view returns (uint) {
        return totalQuizCount;
    }

}