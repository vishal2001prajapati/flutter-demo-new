import 'package:flutter/material.dart';

class CardDemo extends StatefulWidget {
  const CardDemo({Key? key}) : super(key: key);

  @override
  State<CardDemo> createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Stack(
                    children: [
                    /*  Image.asset(
                        'assets/image/image_demo.jpg',
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),*/
                      const Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Text(
                          'Hello Card',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                        'Basically a function or a method that we pass as an argument into another function'),
                  ),
                ],
              ),
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
