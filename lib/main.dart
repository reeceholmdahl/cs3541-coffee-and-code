import 'dart:core';
import 'dart:developer';
import 'package:firstapp/alarms.dart';
import 'package:firstapp/coffee_data.dart';
import 'package:firstapp/constants.dart';
import 'package:firstapp/journal/journal.dart';
import 'package:firstapp/login.dart';
import 'package:firstapp/settings.dart';
import 'package:firstapp/video_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'informatics.dart';

late final List<CoffeeData> coffeeData;
int pageIndex = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Black,
    ),
  );
  coffeeData = await loadCoffeeDatabaseFromFile();
  // runApp(LoginPage());
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'coffee and code',
      home: LoginPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final GoogleSignInAccount account;

  MainPage(
    this.account, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(account.toString());
    return StatefulBuilder(
      builder: (context, setState) => Scaffold(
        resizeToAvoidBottomInset: false,
        restorationId: 'coffee and code',
        backgroundColor: Brown,
        appBar: AppBar(
          backgroundColor: Navy,
          title: const Center(
              child: Text("coffee && code;",
                  style: TextStyle(
                      color: White,
                      fontFamily: 'monospace',
                      fontSize: 32,
                      fontWeight: FontWeight.bold))),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontFamily: 'monospace'),
          unselectedLabelStyle: TextStyle(fontFamily: 'monospace'),
          currentIndex: pageIndex,
          elevation: 3,
          selectedItemColor: WashedRed,
          unselectedItemColor: White,
          onTap: (index) {
            setState(() => pageIndex = index);
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Navy,
                icon: const Icon(Icons.data_thresholding_sharp),
                label: 'Analytics'),
            BottomNavigationBarItem(
                backgroundColor: Navy,
                icon: const Icon(Icons.library_books_sharp),
                label: 'Diary'),
            BottomNavigationBarItem(
                backgroundColor: Navy,
                icon: const Icon(Icons.video_library_sharp),
                label: 'Videos'),
            BottomNavigationBarItem(
                backgroundColor: Navy,
                icon: const Icon(Icons.alarm_sharp),
                label: 'Alarms'),
            BottomNavigationBarItem(
                backgroundColor: Navy,
                icon: const Icon(Icons.settings_sharp),
                label: 'Settings'),
          ],
        ),
        body: Builder(builder: (context) {
          if (pageIndex == 0) {
            return Informatics();
          } else if (pageIndex == 1) {
            return CoffeeJournal();
          } else if (pageIndex == 2) {
            return VideoList();
          } else if (pageIndex == 3) {
            return Alarms();
          } else if (pageIndex == 4) {
            return Settings();
          }
          throw UnimplementedError();
        }),
      ),
    );
  }
}
