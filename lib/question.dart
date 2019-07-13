import "package:flutter/material.dart";

class Question extends StatelessWidget {
  final question;

  Question({this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:EdgeInsets.all(10.0),
      child: Text(
        question,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
