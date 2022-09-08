import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StreamProviderDemo extends StatefulWidget {
  const StreamProviderDemo({Key? key}) : super(key: key);

  @override
  State<StreamProviderDemo> createState() => _StreamProviderDemoState();
}

class _StreamProviderDemoState extends State<StreamProviderDemo> {
/*  int _counterValue = 0;

  void _incrementValue() {
    setState(() {
      _counterValue++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyModelOne>(
      initialData: MyModelOne(someValueOne: '0'),
      create: (BuildContext context) => GetModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Consumer<MyModelOne>(
                  builder: (context, MyModel, child) {
                    return Text(
                      'StreamProvider Value is: ${MyModel.someValueOne}',
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),
              ),
              Container(child: Consumer<MyModelOne>(
                builder: (context, MyModelOne, child) {
                  return ElevatedButton(
                      onPressed: () {
                        MyModelOne.doSomthingOne();
                      },
                      child: Text('Update'));
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}

Stream<MyModelOne> GetModel() {
  return Stream<MyModelOne>.periodic(
      Duration(seconds: 1), (x) => MyModelOne(someValueOne: '$x')).take(50);
}

class MyModelOne {
  String someValueOne;

  MyModelOne({required this.someValueOne});

  Future<void> doSomthingOne() async {
    await Future.delayed(Duration(seconds: 2));
    someValueOne = 'vishal';
  }
}
