import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
    required this.image,
    required this.backgroundColor,
    required this.duration,
    // this.onWillPop,
  }) : super(key: key);

  final String image;
  final Color? backgroundColor;
  final int duration;
  // final VoidCallback? onWillPop;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // body: const Center(
        // child: Image.asset(image),
        //  text : Text("hello"),
        // ),
        // backgroundColor: Colors.red,
        );
  }
}
