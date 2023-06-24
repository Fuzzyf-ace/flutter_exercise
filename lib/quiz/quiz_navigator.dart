import 'package:flutter/material.dart';
import 'package:flutter_exercise/quiz/data/questions.dart';
import 'package:flutter_exercise/quiz/questions_screen.dart';
import 'package:flutter_exercise/quiz/start_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const StartScreen();
      },
      routes: <RouteBase>[
        ...questions.asMap().entries.map(
          (question) {
            final int index = question.key;
            return GoRoute(
              path: 'questions/$index',
              builder: (BuildContext context, GoRouterState state) {
                return QuestionScreen(
                  question: questions[index],
                  currentQuestion: index,
                  numberOfQuestions: questions.length,
                );
              },
            );
          },
        ),
      ],
    ),
  ],
);

class QuizNavigator extends StatelessWidget {
  const QuizNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
