import 'package:animation/animations/test_animation_with_controllers.dart';
import 'package:animation/animations/test_flutter_logo.dart';
import 'package:flutter/material.dart';
import 'animations/custom_painter_examples/bouncing_ball_animation.dart';
import 'animations/test_animated_cross_fade.dart';
import 'animations/sand_box.dart';
import 'animations/test_animated_list_view.dart';
import 'animations/test_curves_animation.dart';
import 'animations/test_hero_animation.dart';
import 'animations/test_transforms.dart';
import 'animations/test_tween_animation_builder.dart';

void main() {
  runApp(const AnimationApp());
}

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SandBox()
    );
  }
}
