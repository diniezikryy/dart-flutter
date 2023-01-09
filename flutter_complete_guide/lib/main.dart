import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  Widget build(BuildContext context) {
    var questions = [
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

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Hello World!"),
      ),
      body: Column(children: <Widget>[
        Question(questions[_questionIndex]),
        Answer(_answerQuestion),
        Answer(_answerQuestion),
        Answer(_answerQuestion),
      ]),
    ));
  }
}

// Have one widget per file
