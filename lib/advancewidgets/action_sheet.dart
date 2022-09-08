import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionSheetDemo extends StatefulWidget {
  const ActionSheetDemo({Key? key}) : super(key: key);

  @override
  State<ActionSheetDemo> createState() => _ActionSheetDemoState();
}

class _ActionSheetDemoState extends State<ActionSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ActionSheet'),
      ),
      body: Center(
        child: CupertinoButton.filled(
            child: Text('Show Action'),
            onPressed: () async {
              final int? number = await showCupertinoModalPopup(
                  context: context, builder: buildActionSheet);
              print('you click $number');
            }),
      ),
    );
  }

  Widget buildActionSheet(BuildContext context) => CupertinoActionSheet(
        title: const Text('ActionSheet Title'),
        message: const Text('This is a ActionSheet Message'),
        actions: [
          CupertinoActionSheetAction(
            isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context, 1);
              },
              child: const Text('Add')),
          CupertinoActionSheetAction(
            isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context, 2);
              },
              child: const Text('Edit')),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context, 3);
              },
              child: const Text('Delete')),
        ],

        cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel')),
      );
}
