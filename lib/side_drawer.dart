import 'package:firstapp/main.dart';
import 'package:flutter/material.dart';

import 'package:firstapp/settings.dart';
import 'package:firstapp/alarms.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(201, 189, 182, 10),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: const DecorationImage(
                image: AssetImage('assets/side_drawer_image.jpg'),
                fit: BoxFit.cover,
              ),
              //color: Colors.blue,
              //alignment: Alignment.center,
            ),
            child: Text(
              ' ',
              style: const TextStyle(
                fontSize: 45,
              ),
            ),
            margin: EdgeInsets.all(0),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
          ),
          ListTile(
            title: const Text('Alarms'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const Alarms()));
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
          )
        ],
      ),
    );
  }
}
