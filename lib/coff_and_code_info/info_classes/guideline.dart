import 'package:flutter/material.dart';
import 'information.dart';

class Guideline extends Information {

  Guideline(String title, List<String> info, int type) : super(title, type){
    super.details = detailsBuilder(info);
    decideAvatarProperties();
  }

  void decideAvatarProperties() {

  }

  String detailsBuilder(List<String> info) {
    String details = "";
    details += ("Guideline:\n" + info[0] + "\n");
    details += ("Benefit:\n" + info[1] + "\n");
    details += ("Source:\n" + info[3] + "\n");
    return details;
  }
}