import 'package:animation/animations/test_hero_animation_details_view.dart';
import 'package:flutter/material.dart';

class TestHeroAnimation extends StatefulWidget {
  const TestHeroAnimation({super.key});

  @override
  State<TestHeroAnimation> createState() => _TestHeroAnimationState();
}

class _TestHeroAnimationState extends State<TestHeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TestHeroAnimationDetailsView(),
              ),
            );
          },
          child: Hero(
            //? tag must be different(unique)
            tag: 1,
            child: SizedBox(
              height: 200,
              width: 400,
              child: Image.asset(
                'assets/general.avif',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
