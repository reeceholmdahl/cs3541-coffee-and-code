import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/services.dart" show rootBundle;

@immutable
class CoffeeData {
  final int codingHours;
  final int coffeeCupsPerDay;
  final String coffeeTime;
  final String codingWithoutCoffee;
  final String coffeeType;
  final String coffeeSolveBugs;
  final String gender;
  final String country;
  final String ageRange;
  final int id;

  const CoffeeData(
      this.codingHours,
      this.coffeeCupsPerDay,
      this.coffeeTime,
      this.codingWithoutCoffee,
      this.coffeeType,
      this.coffeeSolveBugs,
      this.gender,
      this.country,
      this.ageRange,
      this.id);

  String toString() {
    return 'ID: $id Hours: $codingHours Cups/day: $coffeeCupsPerDay Coffee time: $coffeeTime Coding without coffee: $codingWithoutCoffee Coffee type: $coffeeType Coffee solves bugs: $coffeeSolveBugs Gender: $gender Country: $country Age range: $ageRange';
    // return id.toString();
  }
}

Future<List<CoffeeData>> loadCoffeeDatabaseFromFile() async {
  final input = await rootBundle.loadString('assets/coffee_and_code.csv');
  List<List<dynamic>> list = const CsvToListConverter().convert(input);
  int id = 0;

  // Remove CSV header and map to model object
  list.removeAt(0);
  return list
      .map((line) => CoffeeData(line[0], line[1], line[2], line[3], line[4],
          line[5], line[6], line[7], line[8], id++))
      .toList();
}
