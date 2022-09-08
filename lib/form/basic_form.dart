import 'package:flutter/material.dart';
import 'details.dart';

class FormDemo extends StatefulWidget {
  const FormDemo({Key? key}) : super(key: key);

  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  _FormDemoState() {
    _selecteVal = sizeList[0];
  }

  // it' for textField
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();

  // dropdown list
  final sizeList = ["Small", "Medium", "Large", "XLarge"];
  String? _selecteVal = "";

  // for dataPassing
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // checkBox
  bool? _checkBox = false;

  bool validate() {
    if (formKey.currentState!.validate()) {
      print('ok');
      return true;
    } else {
      print('Error');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(

                        /* enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepOrange
                          )
                        ),
                        focusedBorder:  OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black
                            )
                        ),*/
                        prefixIcon: Icon(Icons.person),
                        labelText: "Enter Name",
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Required Name";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _email,
                    decoration: const InputDecoration(
                        labelText: "Enter Email",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Required Email";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLength: 10,
                    controller: _phone,
                    // we can set max length of textField
                    /*           inputFormatters: [
                      LengthLimitingTextInputFormatter(10)
                    ],*/
                    decoration: const InputDecoration(
                        labelText: "Enter PhoneNumber",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Required PhoneNumber";
                      } else if (val.length < 10) {
                        return "Max 10 character required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                // checkBox - 1
                /*  Checkbox(

                    value: _checkBox, onChanged: (val) {
                  setState(() {
                    _checkBox = val;
                  });

                }
                ),*/

                // CheckboxListTile - 2
                CheckboxListTile(
                  title: Text("One"),
                  value: _checkBox,
                  onChanged: (val) {
                    setState(() {
                      _checkBox = val;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: Text("One"),
                  value: _checkBox,
                  onChanged: (val) {
                    setState(() {
                      _checkBox = val;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                // DropDown Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                      value: _selecteVal,
                      items: sizeList
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _selecteVal = val as String;
                        });
                      }),
                ),

                Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: DropdownButtonFormField(
                      dropdownColor: Colors.deepPurpleAccent.shade100,
                      icon: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Colors.black,
                      ),
                      value: _selecteVal,
                      items: sizeList
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _selecteVal = val as String;
                        });
                      }),
                ),

                // Button
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (validate()) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailsDemo(
                                      userName: _name.text,
                                      useEmail: _email.text,
                                      userNumber: _phone.text)));
                            }
                          },
                          child: const Text('Submit'))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
