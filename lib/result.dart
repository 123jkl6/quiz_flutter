import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final int score;
  final int questionsCount;
  final Function restartQuiz;
  Result({@required this.score, @required this.questionsCount, @required this.restartQuiz});

  @override
  Widget build(BuildContext context) {
    Color scoreColor;
    //score text color
    if (score < questionsCount/2){
      scoreColor = Colors.red;
    } else {
      scoreColor = Theme.of(context).primaryColor;
    }

    return Column(
      children: [
        Container(child: Text("You are done")),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Your score is "),
              Text(
                score.toString(),
                style: TextStyle(color: scoreColor),
              ),
              Text("/" + questionsCount.toString()),
            ],
          ),
        ),
        RaisedButton(
          color:Theme.of(context).primaryColor,
          textColor: Theme.of(context).accentColor,
          child: Text("Restart Quiz"),
          onPressed: restartQuiz,
        ),
      ],
    );
  }
}
