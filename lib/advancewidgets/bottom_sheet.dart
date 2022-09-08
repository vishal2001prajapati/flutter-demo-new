import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({Key? key}) : super(key: key);

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => showModalBottomSheet(
            // isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            // isDismissible: false,
            backgroundColor: Color(0xffffc8dd),
            context: context,
            builder: (context) => buildSheet(),
          ),
          child: Text('Show bottomSheet'),
        ),
      ),
    );
  }

  Widget buildSheet() => ListView(children: const [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Modal Bottom Sheet is an alternative to a menu or a Specifies whether the user can dismiss m Specifies whether the user can dismiss m dialog and prevents the user from interacting with the rest of the app. It will appear over the UI so that there is no need to navigate to a different page. It can be used to perform a small task that does not require the whole new screen to be built.',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Modal Bottom Sheet is an alternative isDismissible: Specifies whether the user can dismiss modal bottom sheet by tapping on  Specifies whether the user can dismiss modal bottom sheet by tapping on  Specifies whether the user can dismiss modal bottom sheet by tapping on the scrim. to a menu or a dialog and prevents the user from interacting with the rest of the app. It will appear over the UI so that there is no need to navigate to a different page. It can be used to perform a small task that does not require the whole new screen to be built.',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ]);
}
