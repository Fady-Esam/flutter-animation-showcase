import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  const SandBox({super.key});

  @override
  State<SandBox> createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double height = 200;
  double width = 300;
  Color color = Colors.blue;
  bool isPressed = false;
  double opacity = 1;
  double angle = 0;
  double x = 0;
  double y = 0;
  double z = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isPressed = !isPressed;
              height = isPressed ? 300 : 200;
              width = isPressed ? 400 : 300;
              opacity = isPressed ? 0.8 : 1.0;
              angle = isPressed ? 150 : 0;
              color = isPressed ? Colors.red : Colors.blue;
            });
          },
          child: AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(
              milliseconds: 1000,
            ),
            child: AnimatedContainer(
              height: height,
              width: width,
              color: color,
              transform: Matrix4.identity()..rotateZ(angle),
              transformAlignment: FractionalOffset.center,
              curve: Curves.bounceOut,
              duration: const Duration(
                milliseconds: 1000,
              ),
              child: Center(
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      x = x + details.delta.dx / 100; 
                      y = y - details.delta.dy / 100; 
                    });
                  },
                  child: Transform(
                    transform: Matrix4(
                        1,1,2,0,
                        0,1,3,0,
                        1,0,1,0.002,
                        2,0,0,1,
                    )..rotateX(x)..rotateY(y)..rotateZ(z),
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.purple,
                      height: 100,
                      width: 200,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
