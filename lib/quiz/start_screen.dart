import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // title: const Text(
        //   'Start Screen',
        //   style: TextStyle(color: Colors.black, fontSize: 32),
        // ),
        elevation: 0.0,
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
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          //make the column take minimum size on the main axis(vertical)
          children: [
            // const Text('Start Screen'),
            // Opacity(
            //   opacity: 0.7,
            //   child: Image.asset(
            //     'assets/images/quiz-logo.png',
            //     width: 300,
            //   ),
            // ),
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: Colors.blueAccent.shade200.withOpacity(0.8),
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              'Some Text to learn Flutter',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton.icon(
                  onPressed: () => context.go('/questions/0'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                  ),
                  icon: const Icon(Icons.keyboard_arrow_right),
                  label: const Text('Start Quiz'),
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
