import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;

  Quiz quiz = Quiz([
    Question("Elon Musk is human", false),
    Question("Pizza is Healthy", false),
    Question("Flutter is awsome", true),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;

  bool overlayShouldbeVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answare == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldbeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          children: <Widget>[
            AnswerButton(true, () => handleAnswer(true)),

            /// true button
            QuestionText(questionText, questionNumber),
            AnswerButton(false, () => handleAnswer(false)), // false button
          ],
        ),
        overlayShouldbeVisible
            ? CorrectWrongOverlay(isCorrect, () {
                if (quiz.length == questionNumber) {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ScorePage(quiz.score, quiz.length)), (Route route) => route == null );

                  return;
                }
                currentQuestion = quiz.nextQuestion;
                setState(() {
                  overlayShouldbeVisible = false;
                  questionText = currentQuestion.question;
                  questionNumber = quiz.questionNumber;
                });
              })
            : Container(),
      ],
    );
  }
}
