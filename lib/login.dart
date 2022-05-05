import 'dart:developer';

import 'package:firstapp/constants.dart';
import 'package:firstapp/main.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _googleSignIn = GoogleSignIn();
Future<GoogleSignInAccount?> _googleLogin() => _googleSignIn.signIn();

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Brown,
      appBar: AppBar(
        backgroundColor: Navy,
        title: const Center(
          child: Text(
            'user.auth();',
            style: TextStyle(
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
                color: White),
          ),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 64),
          child: Image(image: AssetImage('assets/coffee.png')),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: WashedNavy),
            onPressed: () => googleLogin(context),
            child: const Text('google oauth login',
                style: TextStyle(
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                    color: White))),
      ]),
    );
  }
}

Future<void> googleLogin(BuildContext context) async {
  late final GoogleSignInAccount? account;
  try {
    account = await _googleLogin();
  } catch (ex) {
    log(ex.toString());
  }
  if (account == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'loggedIn == false;',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold,
              color: White),
        ),
      ),
    );
    return;
  } else {
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MainPage(account!)));
    return;
  }
}
