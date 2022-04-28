import 'package:flutter/material.dart';

@immutable
class Temp {
  final String name;
  final MaterialColor color;
  final IconData iconData;

  const Temp(this.name, this.color, this.iconData);
}
