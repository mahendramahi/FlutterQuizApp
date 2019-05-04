import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);

  @override
  State<StatefulWidget> createState() {
    return QuestionTextState();
  }
}

class QuestionTextState extends State<QuestionText>
    with TickerProviderStateMixin {
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fontSizeAnimationController = AnimationController(
        duration: Duration(
          milliseconds: 500,
        ),
        vsync: this);
    _fontSizeAnimation = CurvedAnimation(
        parent: _fontSizeAnimationController, curve: Curves.bounceOut);

    _fontSizeAnimation.addListener(() {
      setState(() {});
    });

    //to Start Animation
    _fontSizeAnimationController.forward();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question !=  widget._question) {
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  void dispose() {
    _fontSizeAnimationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            "Statement " +
                widget._questionNumber.toString() +
                ": " +
                widget._question,
            style: TextStyle(
              fontSize: _fontSizeAnimation.value * 20,
            ),
          ),
        ),
      ),
    );
  }
}
