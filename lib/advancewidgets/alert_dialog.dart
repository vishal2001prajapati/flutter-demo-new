import 'package:flutter/material.dart';

class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({Key? key}) : super(key: key);

  @override
  State<AlertDialogDemo> createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertDialog Box"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showAlertDialog(context);
          },
          child: Text('click to Alert'),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    Widget cancelBtn = TextButton(onPressed: () {}, child: const Text('Yes'));
    Widget yesBtn = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('No'));

    AlertDialog alertDialog = AlertDialog(
      title: Text('Warning!'),
      content: Text('This is a alert Dialog'),
      actions: [cancelBtn, yesBtn],
    );

    showDialog(
        context: context,
        builder: (BuildContext buildercontext) {
          return alertDialog;
        });
  }
}
