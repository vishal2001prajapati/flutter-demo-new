import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
        appBar: AppBar(),
        backgroundColor: Colors.green,
        body: Center(
          child: IconButton(
            icon: Icon(
              Icons.alt_route_rounded,
            ),
            onPressed: () {
              print('icon is pressed');
            },
            iconSize: 100,
            color: Colors.pink,
            splashColor: Colors.white,
            highlightColor: Colors.deepOrange,
          ),
        ));
  }
}