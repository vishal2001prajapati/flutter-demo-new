import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginAPICalling extends StatefulWidget {
  const LoginAPICalling({Key? key}) : super(key: key);

  @override
  State<LoginAPICalling> createState() => _LoginAPICallingState();
}

class _LoginAPICallingState extends State<LoginAPICalling> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login API Call')),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Enter Email',
                label: const Text('Enter Email'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: 'Enter Password',
                label: const Text('Enter Password'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                login(_emailController.text.toString(),
                    _passwordController.text.toString());
              },
              child: const Text('Login')),
        ],
      ),
    );
  }

  void login(String email, String password) async {
    try {
      String url = "https://reqres.in/api/login";
      Response response = await post(Uri.parse(url),
          body: {'email': email, 'password': password});
      print('response.body-->${response.body}');
      print('statusCode is-->${response.statusCode}');

      if (response.statusCode == 200) {
        var snackBar = const SnackBar(
          content: Text('login Success'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        var snackBar = const SnackBar(
          content: Text('login Failed'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
