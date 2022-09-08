import 'package:flutter/material.dart';

class DetailsDemo extends StatelessWidget {
  String userName, useEmail, userNumber;

  DetailsDemo(
      {required this.userName,
      required this.useEmail,
      required this.userNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name is:$userName'),
            Text('Email is:$useEmail'),
            Text('PhoneNumber is:$userNumber'),
          ],
        ),
      ),
    );
  }
}
