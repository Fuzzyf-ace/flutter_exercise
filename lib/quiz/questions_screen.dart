import 'package:flutter/material.dart';
import 'package:flutter_exercise/quiz/answer_button.dart';
import 'package:flutter_exercise/quiz/model/quiz_question.dart';
import 'package:go_router/go_router.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {required this.question,
      super.key,
      required this.numberOfQuestions,
      required this.currentQuestion});

  final QuizQuestion question;
  final int currentQuestion;
  final int numberOfQuestions;

  @override
  State<StatefulWidget> createState() {
    return QuestionScreenState();
  }
}

class QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
  }

  void goPrev() {
    if (widget.currentQuestion - 1 >= 0) {
      context.go('/questions/${widget.currentQuestion - 1}');
    }
  }

  void goNext() {
    if (widget.currentQuestion < widget.numberOfQuestions - 1) {
      context.go('/questions/${widget.currentQuestion + 1}');
    } else {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Questions Screen',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        // elevation: 0.0,
        shadowColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightGreenAccent, Colors.yellow, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FilledButton(
                      style: FilledButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.elliptical(10.0, 20.0),
                            bottomRight: Radius.elliptical(10.0, 20.0),
                          ),
                        ),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_back_ios),
                          Text('Prev'),
                        ],
                      ),
                      onPressed: () {
                        goPrev();
                      },
                    ),
                    Text(
                        'Current Question:${widget.currentQuestion + 1}/${widget.numberOfQuestions}'),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(10.0, 20.0),
                            bottomLeft: Radius.elliptical(10.0, 20.0),
                          ),
                        ),
                      ),
                      child:
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              widget.currentQuestion + 1 == widget.numberOfQuestions
                                  ? const Text('Results')
                                  : const Text('Next'),
                              const Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                      onPressed: () {
                        goNext();
                      },
                    ),
                  ],
                ),
              ],
            ),
            Align(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //
                      //question
                      Text(widget.question.text),
                      ...widget.question.answers.map((answer) =>
                          AnswerButton(text: answer, onPressed: () => {})),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
