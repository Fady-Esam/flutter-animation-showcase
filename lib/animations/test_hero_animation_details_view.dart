import 'package:flutter/material.dart';

class TestHeroAnimationDetailsView extends StatefulWidget {
  const TestHeroAnimationDetailsView({super.key});

  @override
  State<TestHeroAnimationDetailsView> createState() =>
      _TestHeroAnimationDetailsViewState();
}

class _TestHeroAnimationDetailsViewState
    extends State<TestHeroAnimationDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: 1,
        child: Container(
          height: 400,
          width: double.infinity,
          margin: const EdgeInsets.only(right: 18, left: 18),
          child: Image.asset('assets/general.avif'),
        ),
      ),
    );
  }
}
