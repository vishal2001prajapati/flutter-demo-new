import 'package:flutter/material.dart';

class RadioBtn extends StatefulWidget {
  const RadioBtn({Key? key}) : super(key: key);

  @override
  State<RadioBtn> createState() => _RadioBtnState();
}

class _RadioBtnState extends State<RadioBtn> {
  String colorGroupValue = '';
  Color _blubColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioButton'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lightbulb_outlined,
              color: _blubColor,
              size: 100,
            ),

            // RadioButton and it's type
            // radio - 1 it does not contain label
            // Radio(value: null, groupValue: null, onChanged: null),
            // radio - 2 it contains label
            RadioListTile(
                value: 'Yellow',
                groupValue: colorGroupValue,
                title: Text('Yellow'),
                onChanged: (val) {
                  colorGroupValue = val as String;
                  setState(() {
                    _blubColor = Colors.yellow;
                  });
                }),
            RadioListTile(
                value: 'Green',
                groupValue: colorGroupValue,
                title: Text('Green'),
                onChanged: (val) {
                  colorGroupValue = val as String;
                  setState(() {
                    _blubColor = Colors.green;
                  });
                }),
            RadioListTile(
                value: 'Red',
                groupValue: colorGroupValue,
                title: Text('Red'),
                onChanged: (val) {
                  colorGroupValue = val as String;
                  setState(() {
                    _blubColor = Colors.red;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
