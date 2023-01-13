import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import 'quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What is your favourite color?",
      "answers": [
        "Black",
        "Red",
        "Green",
        "White",
      ]
    },
    {
      "questionText": "What is your favourite animal?",
      "answers": [
        "Elephant",
        "Tiger",
        "Ant",
        "Giraffe",
      ]
    },
    {
      "questionText": "What is your favourite instructor?",
      "answers": [
        "Max",
        "Max",
        "Max",
        "Max",
      ]
    }
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Hello World!"),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(_answerQuestion, _questions, _questionIndex)
          : Center(child: Text("You did it!")),
    ));
  }
}

// Have one widget per file
