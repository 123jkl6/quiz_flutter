import "package:flutter/material.dart";
import 'package:flutter/painting.dart';

class Answer extends StatelessWidget {
  final String option;
  final Function answerQuestion;

  Answer({@required this.answerQuestion, @required this.option});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding:EdgeInsets.symmetric(horizontal: 10.0),
      child: RaisedButton(
          color: Theme.of(context).primaryColor,
          textColor: Theme.of(context).accentColor,
          child: Text(option),
          onPressed: (){
            answerQuestion(option);
          }),
    );
  }
}
