import 'package:flutter/material.dart';

void main() {
  runApp(const columnWidgets());
}

class columnWidgets extends StatelessWidget {
  const columnWidgets({Key? key}) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Column Widgets"),
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          // verticalDirection: VerticalDirection.up,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(

              padding: const EdgeInsets.all(40),
              color: Colors.amberAccent,
              child: const Text(
                'First',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(40),
              color: Colors.yellow,
              child: const Text(
                'Second',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(40),
              color: Colors.green,
              child: const Text(
                'Third',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ));
  }
}