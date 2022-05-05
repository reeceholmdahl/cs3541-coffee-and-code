import 'dart:developer';
import 'dart:math' as math;

import 'package:coffee_and_code/constants.dart';
import 'package:coffee_and_code/main.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _googleSignIn = GoogleSignIn();
Future<GoogleSignInAccount?> _googleLogin() => _googleSignIn.signIn();

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  GoogleSignInAccount? _account;

  late final AnimationController _ctrl;
  late final Animation<double> _screenSpace;

  @override
  void initState() {
    super.initState();
    _googleSignIn.disconnect();
    _ctrl = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _screenSpace = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _ctrl, curve: Curves.easeInOutCubicEmphasized));
  }

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
      body: Stack(children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 64),
            child: Image(image: AssetImage('assets/coffee.png')),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: WashedNavy),
              onPressed: () => googleLogin(context, (account) {
                    setState(() {
                      _account = account;
                      _ctrl.forward();
                    });
                    Future.delayed(Duration(milliseconds: 3250), () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainPage(_account!)),
                      );
                    });
                  }),
              child: const Text('google oauth login',
                  style: TextStyle(
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                      color: White))),
        ]),
        if (_account != null)
          Positioned(
            bottom: 0,
            child: Container(
              child: AnimatedBuilder(
                  animation: _ctrl,
                  builder: (BuildContext context, Widget? child) {
                    return SizeTransition(
                      sizeFactor: _screenSpace,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey,
                        child: _ctrl.value > 0.2
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        // color: Colors.blue,
                                        width: 200,
                                        height: 200,
                                        child: Opacity(
                                          opacity: math.min(_ctrl.value * 5, 1),
                                          child: GoogleUserCircleAvatar(
                                              identity: _account!),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 32)),
                                    Text(
                                        'user.welcome(${_account!.displayName ?? 'unnamed'});',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'monospace',
                                            fontWeight: FontWeight.bold,
                                            color: White)),
                                  ],
                                ),
                              )
                            : null,
                      ),
                      axis: Axis.vertical,
                    );
                  }),
            ),
          )
      ]),
    );
  }
}

Future<void> googleLogin(
    BuildContext context, void Function(GoogleSignInAccount) onLogin) async {
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
  } else {
    onLogin(account);
  }
}
