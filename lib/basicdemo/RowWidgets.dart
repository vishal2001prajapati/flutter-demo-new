import 'package:flutter/material.dart';

void main() {
  runApp(const RowWidgets());
}

class RowWidgets extends StatelessWidget {
  const RowWidgets({Key? key}) : super(key: key);

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
          title: const Text("Row Widgets"),
        ),
        body: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // verticalDirection: VerticalDirection.up,
          // textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(30),
                constraints:
                    const BoxConstraints(maxHeight: 150.0, maxWidth: 150.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 5),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10.0,
                        offset: Offset(5.0, 5.0),
                        // color: Colors.deepOrange,
                      )
                    ],
                    // shape: BoxShape.circle,
                    // note:- we can  give specific radius like, topLeft
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.amberAccent),
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'First ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )

            /*         Container(
              padding: const EdgeInsets.all(30),
              color: Colors.yellow,
              margin: EdgeInsets.all(10),
              child: const Text(
                'Second',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              color: Colors.green,
              alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              child: const Text(
                'Third',
                style: TextStyle(fontSize: 20),
              ),
            )*/
          ],
        ));
  }
}
