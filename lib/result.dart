import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase{
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and Innocent!' + " score: $resultScore";
    }else if (resultScore <= 12) {
      resultText = 'Pretty likeable!' + " score: $resultScore";
    }else if (resultScore <= 16) {
      resultText = 'You are ... strange!' + " score: $resultScore";
    }else{
      resultText = 'You are so bad!' + " score: $resultScore";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
                resultPhrase,
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text(
                'Restart Quize',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              textColor: Colors.white,
              shape: Border.all(width:1.0, color: Colors.pink),
              onPressed: resetHandler,
              color: Colors.pink,
            )
          ],
        ),
      )
    );
  }
}
