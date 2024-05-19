import 'package:flutter/material.dart';

class TestTweenAnimationBuilder extends StatefulWidget {
  const TestTweenAnimationBuilder({super.key});

  @override
  State<TestTweenAnimationBuilder> createState() =>
      _TestTweenAnimationBuilderState();
}

class _TestTweenAnimationBuilderState extends State<TestTweenAnimationBuilder> {
  double endValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: endValue),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/general.avif',
                height: value * 250,
              ),
              const SizedBox(height: 22),
              Slider(
                divisions: 100,
                value: value,
                onChanged: (valChange) {
                  value = valChange;
                  endValue = value;
                  setState(() {});
                },
              )
            ],
          );
        },
      ),
    );
  }
}
