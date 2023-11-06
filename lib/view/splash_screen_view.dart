import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
    required this.image,
    required this.backgroundColor,
    required this.duration,
  }) : super(key: key);

  final String image;
  final Color? backgroundColor;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
