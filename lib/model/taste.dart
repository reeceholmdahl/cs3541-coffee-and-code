import 'package:flutter/material.dart';

@immutable
class Taste {
  final String name;
  final Color color;
  final IconData iconData;

  const Taste(this.name, this.color, this.iconData);
}
