import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect, this._onTap);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CorrectWrongOverlayState();
  }
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay>
    with TickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;


  @override
  void dispose() {
    // TODO: implement dispose
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _iconAnimationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);

    _iconAnimation.addListener(() {
      setState(() {});
    });
    _iconAnimationController.forward();

    return Material(
      color: Colors.black54,
      child: InkWell(
        onTap: () => widget._onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Transform.rotate(
                angle: _iconAnimation.value * 2 * pi,
                child: Icon(
                  widget._isCorrect ? Icons.done : Icons.clear,
                  size: 55.0,
                ),
              ),
            ),
            Text(
              widget._isCorrect ? "Correct" : "Wrong",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
