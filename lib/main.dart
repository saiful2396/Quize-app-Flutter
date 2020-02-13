import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/qize.dart';
import 'package:flutter_complete_guide/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _questions = const [
    {
      'questionsText' : 'What\'s your favorite color?',
      'answers' : [
        {'text' : 'Red', 'score' : 10},
        {'text' : 'Green', 'score': 5},
        {'text' : 'Black', 'score' : 3},
        {'text' : 'White', 'score' : 1}
        ]
    },
    {
      'questionsText' : 'What\'s your favorite animal?',
      'answers' : [
        {'text' : 'Rabbit', 'score' : 3},
        {'text' : 'Elephant', 'score' : 11},
        {'text' : 'Cat','score' : 5},
        {'text' : 'Lion', 'score' : 9}
        ]
    },
    {
      'questionsText' : 'Who\'s your Instractor?',
      'answers' : [
        {'text' : 'Saiful', 'score' : 1},
        {'text' : 'Saiful', 'score' : 1},
        {'text' : 'Saiful', 'score' : 1},
        {'text' : 'Saiful', 'score' : 1}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuize () {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion (int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have More question');
    }else{
      print('We have no more question');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Complete Guide'),
        ),
        body: _questionIndex < _questions.length ?
        Quize(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,)
            : Result(_totalScore, _resetQuize),
      ),
    );
  }
}
