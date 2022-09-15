import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lottie'),
      ),
      body: Center(
        child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_GoeyCV7pi2.json',),
      ),
    );
  }
}
