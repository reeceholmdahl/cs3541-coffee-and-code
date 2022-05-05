import 'dart:core';
import 'package:coffee_and_code/constants.dart';
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: WashedNavy,
                  fixedSize: const Size(180, 60),
                ),
                child: Text("App Settings"),
                onPressed: () {
                  AppSettings.openAppSettings();
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: WashedNavy,
                  fixedSize: const Size(180, 60),
                ),
                child: Text("Display Settings"),
                onPressed: () {
                  AppSettings.openDisplaySettings();
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: WashedNavy,
                  fixedSize: const Size(180, 60),
                ),
                child: Text("Notification Settings"),
                onPressed: () {
                  AppSettings.openNotificationSettings();
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: WashedNavy,
                  fixedSize: const Size(180, 60),
                ),
                child: Text("Sound Settings"),
                onPressed: () {
                  AppSettings.openSoundSettings();
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: WashedNavy,
                  fixedSize: const Size(180, 60),
                ),
                child: Text("Battery Settings"),
                onPressed: () {
                  AppSettings.openBatteryOptimizationSettings();
                }),
          ),
        ],
      ),
    );
  }
}
