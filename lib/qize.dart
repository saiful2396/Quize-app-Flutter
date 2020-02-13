import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';

class Quize extends StatelessWidget {

  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;
  Quize({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Question(questions[questionIndex]['questionsText'],
          ),
          ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
              .map((answer){
            return Answers(()=>answerQuestion(answer['score']), answer['text']);
          }).toList()
        ],
      ),
    );
  }
}
