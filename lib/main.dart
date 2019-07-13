import 'package:flutter/material.dart';
import "./question.dart";
import "./answer.dart";
import "./result.dart";

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState<QuizApp> extends State {
  var _isDone = false;
  var _score = 0;
  final _questions = [
    {
      "question": "What is your favourite colour?",
      "options": [
        "Blue",
        "Green",
        "Red",
        "Yellow",
      ],
      "answer": "Blue",
    },
    {
      "question": "What is your favourite animal?",
      "options": [
        "Horse",
        "Giraffe",
        "Elephant",
        "Hippopotamus",
      ],
      "answer": "Horse",
    },
  ];

  final _answers = [];

  var _questionIdx = 0;

  void _answerQuestion(String option) {
    _answers.add(option);
    
    if (_questionIdx == _questions.length - 1) {
      //end of quiz
      calculateScore();
      setState(() {
        _isDone = true;
      });
    } else {
      setState(() {
        _questionIdx++;
      });
    }

    print("answer");
  }

  calculateScore() {
    print(_answers);
    _questions.asMap().forEach((index, question) {
      if (question["answer"] == _answers[index]) {
        //add score
        _score++;
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      _questionIdx = 0;
      _score = 0;
      _answers.clear();
      _isDone = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (_isDone) {
      body = Result(score: _score, questionsCount: _questions.length,restartQuiz: _restartQuiz,);
    } else {
      body = ListView(
        children: <Widget>[
          Question(question: _questions.elementAt(_questionIdx)["question"]),
          ...(_questions[_questionIdx]["options"] as List<String>).map((el) {
            return Answer(
              answerQuestion: _answerQuestion,
              option: el,
            );
          })
        ],
      );
    }

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.white,
        brightness: Brightness.light,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Quiz App"),
          ),
          body: body),
    );
  }
}
