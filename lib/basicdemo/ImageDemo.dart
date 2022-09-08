import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  const ImageDemo({Key? key}) : super(key: key);

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
      body: Center(
        child: Center(
          child: Image.network(
            'http://static.demilked.com/wp-content/uploads/2015/01/bugs-snails-mushrooms-macro-photography-nature-vadim-trunov-fb.jpg',
            fit: BoxFit.contain,
            semanticLabel: 'simple image display',
            // colorBlendMode: BlendMode.modulate,
            // color: Colors.red,
          ),
        ),
      ),
    );
  }
}
