import 'package:flutter/material.dart';

class typesOfButton extends StatelessWidget {
  const typesOfButton({Key? key}) : super(key: key);

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
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(100),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: OutlinedButton.icon(
                      icon: Icon(Icons.access_alarm_outlined),
                      label: Text('Elevated Button'),
                      onPressed: () {},

                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(25),
                          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          primary: Colors.yellow,
                          elevation: 15,
                          shadowColor: Colors.red,
                          // shape: StadiumBorder(),
                          // btn give border
                          side: BorderSide(color: Colors.black87, width: 2),
                          alignment: Alignment.topRight,
                          onPrimary: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
