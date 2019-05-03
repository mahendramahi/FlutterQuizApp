import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            AnswerButton(true, () => {print('your answer true')}),
           QuestionText("Pizza is nice", 1),
            AnswerButton(false, () => {print('your answer false')}),
          ],
        )
      ],
    );
  }
}
