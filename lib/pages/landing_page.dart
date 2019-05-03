import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.greenAccent,
      child: InkWell(
        onTap: () => print('tap the button'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lets Quizzz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Tap to Start',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
