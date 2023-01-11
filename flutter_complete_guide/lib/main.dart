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
  final questions = const [
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
    if (_questionIndex < questions.length) {}
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
      body: Column(children: <Widget>[
        Question(questions[_questionIndex]['questionText']),
        ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(_answerQuestion, answer);
        }).toList()
      ]),
    ));
  }
}

// Have one widget per file
