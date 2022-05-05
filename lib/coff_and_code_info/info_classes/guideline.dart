import 'package:flutter/material.dart';
import 'information.dart';

class Guideline extends Information {

  Guideline(String title, List<String> info, int type) : super(title, type){
    super.details = detailsBuilder(info);
    decideAvatarProperties();
  }

  void decideAvatarProperties() {
    //type 1 = variable, type 2 = function, type 3 = readability
    switch (type) {
      case 1:
        super.assignAvatarProperties(
            Colors.deepOrangeAccent, Colors.orange[100], Icons.cancel_presentation);
        break;
      case 2:
        super.assignAvatarProperties(
            Colors.blueAccent, Colors.blue[100], Icons.account_tree_outlined);
        break;
      case 3:
        super.assignAvatarProperties(
            Colors.amber, Colors.yellow[50], Icons.menu_book);
        break;
      default:
        super.assignAvatarProperties(
            Colors.white, Colors.white, Icons.add_circle_outlined);
        break;
    }
  }

  String detailsBuilder(List<String> info) {
    String details = "";
    details += ("Description:\n" + info[0] + "\n");
    details += ("Source:\n" + info[1] + "\n");
    return details;
  }
}