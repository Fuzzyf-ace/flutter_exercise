import 'package:flutter/material.dart';
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
        GoRoute(
          path: 'quiz',
          builder: (BuildContext context, GoRouterState state) {
            return const StartScreen();
          },
        ),
        GoRoute(
          path: 'questions',
          builder: (BuildContext context, GoRouterState state) {
            return const QuestionsScreen();
          },
        ),
      ],
    ),
  ],
);

class QuizNavigator extends StatelessWidget{
  const QuizNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}