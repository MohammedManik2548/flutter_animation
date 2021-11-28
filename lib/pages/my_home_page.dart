import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final AnimationController animationController2;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    animationController2 =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: [
              AnimatedBuilder(
        animation: animationController,
        child: Container(
              height: 100,
              width: 100,
              color: Colors.blue,
              child: Text('huddddai'),
        ),
        builder: (context, child) {
              print(animationController.value);
              // return Transform.scale(
              //   scale: animationController.value * 3,
              //   child: child,
              // );
              // return Transform.rotate(
              //   angle: animationController.value * pi*2,
              //   child: child,
              // );
              return Transform.translate(
                offset: Offset(animationController.value * 200,
                    animationController.value * 500),
                child: child,
              );
        },
      ),
              AnimatedBuilder(
        animation: animationController2,
        child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: Text('huddddai'),
        ),
        builder: (context, child) {
              print(animationController2.value);
              // return Transform.scale(
              //   scale: animationController.value * 3,
              //   child: child,
              // );
              return Transform.rotate(
                angle: animationController2.value * pi*2,
                child: child,
              );
              // return Transform.translate(
              //   offset: Offset(animationController.value * 200,
              //       animationController.value * 500),
              //   child: child,
              // );
        },
      ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.adjust),
        onPressed: () {
          animationController.forward();
          animationController2.forward();
        },
      ),
    );
  }
}
