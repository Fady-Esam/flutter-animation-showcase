import 'dart:math';
import 'package:flutter/material.dart';

class TestTransforms extends StatefulWidget {
  const TestTransforms({super.key});

  @override
  State<TestTransforms> createState() => _TestTransformsState();
}

class _TestTransformsState extends State<TestTransforms> {
  double changedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // Transform.rotate(
          //   angle: changedValue * (pi / 180),
          //   origin: const Offset(75, -100),
          //   child: Center(
          //     child: Container(
          //       height: 150,
          //       width: 200,
          //       color: Colors.red,
          //     ),
          //   ),
          // ),

          Transform(
            transform: Matrix4.rotationZ(pi / 4)
              ..scale(1.5)
              ..rotateY(pi / 3),
            origin: const Offset(200, 0),
            child: Center(
              child: Container(
                height: 150,
                width: 200,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Slider(
            min: 0,
            max: 360,
            value: changedValue,
            onChanged: (value) {
              changedValue = value;
              setState(() {});
            },
          ),
          Text(changedValue.toStringAsFixed(2)),
        ],
      ),
    );
  }
}
