import 'package:flutter/material.dart';

class TestAnimatedCrossFade extends StatefulWidget {
  const TestAnimatedCrossFade({super.key});

  @override
  State<TestAnimatedCrossFade> createState() => _TestAnimatedCrossFadeState();
}

class _TestAnimatedCrossFadeState extends State<TestAnimatedCrossFade> {

  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedCrossFade(
              firstChild: Container(
                height: 200,
                width: 200,
                color: Colors.red,
              ),
              secondChild: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
              crossFadeState: isFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(
                seconds: 1,
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isFirst = !isFirst;
              });
            },
            child: const Text(
              'change cross fade state',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
