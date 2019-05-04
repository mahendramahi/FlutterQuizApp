import 'package:flutter/material.dart';

import './landing_page.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestion;

  ScorePage(this.score, this.totalQuestion);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your Score: ',
            style: TextStyle(
              fontSize: 50.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            score.toString() + '/' + totalQuestion.toString(),
            style: TextStyle(
              fontSize: 50.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 55.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                builder: (BuildContext context) => LandingPage()), (Route route) => route == null),
          )
        ],
      ),
    );
  }
}
