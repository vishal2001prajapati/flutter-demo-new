import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoChangeProvider extends StatefulWidget {
  const DemoChangeProvider({Key? key}) : super(key: key);

  @override
  State<DemoChangeProvider> createState() => _DemoChangeProviderState();
}

class _DemoChangeProviderState extends State<DemoChangeProvider> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (BuildContext context) => MyModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Consumer<MyModel>(
                  builder: (context, MyModel, child) {
                    return Text(
                      'Update Value is: ${MyModel.someValue}',
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),
              ),
              Container(child: Consumer<MyModel>(
                builder: (context, MyModel, child) {
                  return ElevatedButton(
                      onPressed: () {
                        MyModel.doSomething();
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

class MyModel with ChangeNotifier {
  int someValue = 0;

  void doSomething() {
    someValue++;
    notifyListeners();
  }
}
