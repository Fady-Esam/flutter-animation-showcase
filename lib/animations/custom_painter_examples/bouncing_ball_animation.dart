import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> bounceAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    bounceAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: bounceAnimation,
          builder: (context, child) {
            return CustomPaint(
              size: const Size(150, 150),
              painter: BouncingBallPainter(
                animation: bounceAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }
}

class BouncingBallPainter extends CustomPainter {
  final double animation;

  BouncingBallPainter({
    super.repaint,
    required this.animation,
  });
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width / 2, size.height - (size.height * animation)),
      30,
      Paint()..color = Colors.blue,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
