import 'package:flutter/material.dart';

void main() {
  runApp(const secondScreen());
}

class secondScreen extends StatelessWidget {
  const secondScreen({Key? key}) : super(key: key);

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
  // Future<bool?> _showMyDialog(BuildContext context) => showDialog(context: context, builder: (context) => AlertDialog(
  //   title: Text('Dou you want to exit?'),
  //   actions: [
  //     TextButton(onPressed: () => Navigator.pop(context,false), child: Text('Cancel')),
  //     TextButton(onPressed: () => Navigator.pop(context,true), child: Text('Yes'))
  //   ],
  // ));

  Future<bool> onWillPop() async {
    /*  DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: Translations.of(context).strPressBackToExit,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Constants.appBlueColor,
          textColor: Colors.white,
          fontSize: 16.0);*/
    return Future.value(false);
    //  }
    //return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Second Screen"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  'Lorem ipsum  sit amet. Aut nemo provident ab adipisci assumenda sed odit voluptates ut ullam quod. Et unde cumque in velit dolor aut repellat commodi et molestiae illum est suscipit eum autem consequatur! Ut incidunt cumque ea voluptatem exercitationem eos voluptates atque quo voluptas quo inventore sapiente. Qui molestiae suscipit et nisi deserunt et officiis esse.',
                  // overflow: TextOverflow.fade,
                  // maxLines: 2,
                  // textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 20,
                      // letterSpacing: 8,
                      //    backgroundColor: Colors.deepOrange,
                      //    wordSpacing: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                      color: Colors.green),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(25),
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context )=> MyApp()));

                        final textSnackBar = 'This is a snackBar Message';
                        final snackBar = SnackBar(
                            action: SnackBarAction(
                                label: 'Dismiss', onPressed: () {}),
                            content: Text(textSnackBar));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("Move First Screen ")))
            ],
          ),
        ),
      ),
    );
  }
}
