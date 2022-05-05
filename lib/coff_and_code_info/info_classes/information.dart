import 'package:flutter/material.dart';

class Information {
  late String title;
  late String details;
  late int type;
  late bool isFavorited;
  late Color iconColor;
  late Color? backgroundColor;
  late IconData? icon;

  Information(String title, String details, int type) {
    this.title = title;
    this.details = details;
    this.type = type;
    this.isFavorited = false;
  }

  void switchFavorited() {
    isFavorited = !isFavorited;
  }

  String toString() {
    return title;
  }

  void assignAvatarProperties(Color iconColor, Color? backgroundColor, IconData? icon) {
    this.iconColor = iconColor;
    this.backgroundColor = backgroundColor;
    this.icon = icon;
  }
}