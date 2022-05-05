import 'package:flutter/material.dart';
import 'information.dart';

class Shop extends Information {

  Shop(String title, String details, int type) : super(title, details, type) {
    decideAvatarProperties();
  }

  void decideAvatarProperties() {
    switch (type) {
      case 1:
        super.assignAvatarProperties(
            Colors.red, Colors.red[100], Icons.local_fire_department);
        break;
      case 2:
        super.assignAvatarProperties(
            Colors.blueAccent, Colors.blue[100], Icons.ac_unit);
        break;
      default:
        super.assignAvatarProperties(
            Colors.white, Colors.white, Icons.add_circle_outlined);
        break;
    }
  }
}