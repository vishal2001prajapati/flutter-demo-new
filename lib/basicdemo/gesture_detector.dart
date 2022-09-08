import 'package:flutter/material.dart';

class GestureDetectorDemo extends StatelessWidget {
  const GestureDetectorDemo({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int num = 0;
  List<Color> colorList = [
    Color(0xffdda15e),
    Color(0xffa2d2ff),
    Color(0xffbc6c25),
    Color(0xffdda15e),
    Color(0xffe63946),
    Color(0xff606c38),
    Color(0xffe76f51),
    Color(0xffbde0fe),
    Color(0xff14213d),
    Color(0xfffcbf49),
    Color(0xffffd6ff),
    Color(0xff4361ee),
    Color(0xfff4978e),
    Color(0xffdda15e),
    Color(0xffa2d2ff),
    Color(0xffbc6c25),
    Color(0xffdda15e),
    Color(0xffe63946),
    Color(0xff606c38),
    Color(0xffe76f51),
    Color(0xffbde0fe),
    Color(0xff14213d),
    Color(0xfffcbf49),
    Color(0xffffd6ff),
    Color(0xff4361ee),
    Color(0xfff4978e),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GestureDetector Widgets"),
      ),
      body: Align(
        child: GestureDetector(
          onTap: () {
            setState(() {
              num++;
              print(num);
            });
          },
          child: Container(
            height: 200,
            width: 200,
            color: colorList[num],
            child: Align(
              child: Text(
                '$num',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
