import 'dart:developer';

import 'package:flutter/material.dart';

class TestAnimationWithControllers extends StatefulWidget {
  const TestAnimationWithControllers({super.key});

  @override
  State<TestAnimationWithControllers> createState() =>
      _TestAnimationWithControllersState();
}

class _TestAnimationWithControllersState
    extends State<TestAnimationWithControllers>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Color?> colorAnimation;
  late Animation<double> sizeAnimation;
  late Animation<double> curveAnimation;
  bool isFav = false;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
    curveAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.slowMiddle,
    );
    colorAnimation = ColorTween(begin: Colors.grey[600], end: Colors.red)
        .animate(curveAnimation);
    sizeAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 70, end: 100),
        weight: 70,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 100, end: 70),
        weight: 70,
      ),
    ]).animate(curveAnimation);
    animationController.addListener(() {
      log('animationController : ${animationController.value}');
      log('colorAnimation : ${colorAnimation.value}');
      log('colorAnimation : ${sizeAnimation.value}');
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isFav = true;
      } else if (status == AnimationStatus.dismissed) {
        isFav = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return IconButton(
              onPressed: () {
                isFav
                    ? animationController.reverse()
                    : animationController.forward();
              },
              icon: Icon(
                Icons.favorite,
                size: sizeAnimation.value,
                color: colorAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }
}
