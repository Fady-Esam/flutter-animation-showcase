import 'package:flutter/material.dart';

class TestCurvesAndTitle extends StatefulWidget {
  const TestCurvesAndTitle({super.key});

  @override
  State<TestCurvesAndTitle> createState() => _TestCurvesAndTitleState();
}

class _TestCurvesAndTitleState extends State<TestCurvesAndTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(seconds: 1),
        curve: Curves.easeInCubic,
        builder: (context, value, child) {
          return Padding(
            padding: EdgeInsets.only(top: value * 100),
            child: const Text(
              'Hello Animations',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            ),
          );
        },
      ),
    );
  }
}
