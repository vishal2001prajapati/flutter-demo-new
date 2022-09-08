import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// step-1 we have to add this package
import 'package:google_sign_in/google_sign_in.dart';

class GoogleIntegrationDemo extends StatefulWidget {
  const GoogleIntegrationDemo({Key? key}) : super(key: key);

  @override
  State<GoogleIntegrationDemo> createState() => _GoogleIntegrationDemoState();
}

class _GoogleIntegrationDemoState extends State<GoogleIntegrationDemo> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Integration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  googleLogin();
                },
                child: const Text('Google Login')),
            ElevatedButton(
                onPressed: () {
                  logOut();

                },
                child: const Text('SignOut')),
/*           CircleAvatar(
             radius: 50,
             backgroundImage: NetworkImage(user.photoURL),
           ),
            Text('User Name is: ${user.displayName}'),
            Text('Email is: ${user.displayName}'),*/
          ],
        ),
      ),
    );
  }

  googleLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var signInResult = await googleSignIn.signIn();
      if (signInResult == null) {
        return;
      }

      final userData = await signInResult.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print('userdata is: ${userData}');
      print('signInResult is: ${signInResult}');
      print(signInResult.displayName);
      print(signInResult.email);
      print(signInResult.photoUrl);
      print('finalResult is: ${finalResult}');
    } catch (error) {
      print(error);
    }
  }

  Future<void> logOut() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
    print('User is sinOut');

  }
}
