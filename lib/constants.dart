import 'package:flutter/material.dart';

import 'coffee_data.dart';
import 'model/taste.dart';
import 'model/temp.dart';

const _nullName = "Null";
const _nullColor = Colors.grey;

const _NullTaste =
    const Taste(_nullName, Colors.grey, Icons.do_not_disturb_on_total_silence);
const _Bad = const Taste('Bad', Color(0xFFF6403E), Icons.thumb_down_sharp);
const _Good = const Taste('Good', Color(0xFF00F591), Icons.thumb_up_sharp);

const badLighter = Color.fromARGB(255, 252, 202, 201);
const badSplash = Color.fromARGB(255, 255, 149, 147);

const goodLighter = Color.fromARGB(255, 189, 252, 227);
const goodSplash = Color.fromARGB(255, 75, 242, 175);

@immutable
class _TasteType {
  const _TasteType();

  final Null = _NullTaste;
  final Bad = _Bad;
  final Good = _Good;
}

const Tastes = const _TasteType();

const _NullTemp =
    const Temp(_nullName, Colors.grey, Icons.do_not_disturb_on_total_silence);
const _Hot = const Temp('Hot', Colors.red, Icons.whatshot_rounded);
const _Iced = const Temp('Iced', Colors.blue, Icons.snowing);

@immutable
class _TempsType {
  const _TempsType();

  final Null = _NullTemp;
  final Hot = _Hot;
  final Cold = _Iced;
}

const Temps = const _TempsType();

const List<Temp> TempList = const [
  _Hot,
  _Iced,
];

const SampleCoffeeData = const [
  CoffeeData(8, 2, "Before coding", "Yes", "Caffè latte", "Sometimes", "Female",
      "Lebanon", "18 to 29", 0),
  CoffeeData(3, 2, "Before coding", "Yes", "Americano", "Yes", "Female",
      "Lebanon", "30 to 39", 1),
  CoffeeData(5, 3, "While coding", "No", "Nescafe", "Yes", "Female", "Lebanon",
      "18 to 29", 2),
  CoffeeData(8, 2, "Before coding", "No", "Nescafe", "Yes", "Male", "Lebanon",
      "NA", 3),
  CoffeeData(10, 3, "While coding", "Sometimes", "Turkish", "No", "Male",
      "Lebanon", "18 to 29", 4),
  CoffeeData(8, 2, "While coding", "Sometimes", "Nescafe", "Yes", "Male",
      "Lebanon", "30 to 39", 5),
  CoffeeData(5, 2, "While coding", "Yes", "Nescafe", "Sometimes", "Male",
      "Lebanon", "NA", 6)
];

const WashedNavy = Color(0xFF096873);
const Navy = Color(0xFF146A8C);
const LightBlue = Color(0xFFBDE8F2);
const WashedRed = Color(0xFFF27052);
const White = Color(0xFFF2F2F2);
const Brown = Color(0xFF733B27);
const Tan = Color(0xFFBF7C63);
const Beige = Color(0xFFF2C49B);
const Black = Color(0xFF260B01);
