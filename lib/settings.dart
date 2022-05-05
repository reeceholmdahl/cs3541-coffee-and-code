import 'dart:core';
import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(157, 180, 165, 100),
                fixedSize: const Size(180, 60),
              ),
              child: Text("App Settings"),
              onPressed: () {
                AppSettings.openAppSettings();
              }),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(157, 180, 165, 100),
                fixedSize: const Size(180, 60),
              ),
              child: Text("Display Settings"),
              onPressed: () {
                AppSettings.openDisplaySettings();
              }),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(157, 180, 165, 100),
                fixedSize: const Size(180, 60),
              ),
              child: Text("Notification Settings"),
              onPressed: () {
                AppSettings.openNotificationSettings();
              }),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(157, 180, 165, 100),
                fixedSize: const Size(180, 60),
              ),
              child: Text("Sound Settings"),
              onPressed: () {
                AppSettings.openSoundSettings();
              }),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(157, 180, 165, 100),
                fixedSize: const Size(180, 60),
              ),
              child: Text("Battery Settings"),
              onPressed: () {
                AppSettings.openBatteryOptimizationSettings();
              }),
        ],
      ),
    );
  }
}
