import 'package:flutter/material.dart';
import 'information.dart';

class Shop extends Information {

  Shop(String title, List<String> info, int type) : super(title, type) {
    super.details = detailsBuilder(info);
    decideAvatarProperties();
  }

  void decideAvatarProperties() {
    switch (type) {
      case 1:
        super.assignAvatarProperties(
            Colors.green, Colors.green[100], Icons.link);
        break;
      case 2:
        super.assignAvatarProperties(
            Colors.purple, Colors.purple[100], Icons.location_on);
        break;
      default:
        super.assignAvatarProperties(
            Colors.white, Colors.white, Icons.add_circle_outlined);
        break;
    }
  }

  String detailsBuilder(List<String> info) {
    String shopInfo = "";
    shopInfo += ("Address:\n" + info[0] + "\n\n");
    shopInfo += ("Hours:\n" + info[1] + "\n\n");
    shopInfo += ("Drive-through?\n" + info[2] + "\n\n");
    shopInfo += ("Delivery?\n" + info[2] + "\n\n");
    return shopInfo;
  }
}