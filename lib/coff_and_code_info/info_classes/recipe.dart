import 'package:flutter/material.dart';
import 'information.dart';

class Recipe extends Information {

  Recipe(String title, List<String> steps, int type) : super(title, type) {
    super.details = detailsBuilder(steps);
    decideAvatarProperties();
  }

  void decideAvatarProperties() {
    //type 1 = hot, type 2 = iced
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

  String detailsBuilder(List<String> steps) {
    String instructions = "";
    for(int i = 0; i < steps.length; i++) {
      instructions = instructions + "[" + i.toString() + "] " + steps[i] + "\n\n";
    }
    instructions += "\n   Enjoy! :)";
    return instructions;
  }

}