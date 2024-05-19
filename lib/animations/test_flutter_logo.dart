import 'package:flutter/material.dart';

class TestFlutterLogo extends StatefulWidget {
  const TestFlutterLogo({super.key});

  @override
  State<TestFlutterLogo> createState() => _TestFlutterLogoState();
}

class _TestFlutterLogoState extends State<TestFlutterLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> logoAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
    logoAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return RotationTransition(
            turns: logoAnimation,
            child: const FlutterLogo(
              size: 200,
            ),
          );
        },
      ),
    );
  }
}
