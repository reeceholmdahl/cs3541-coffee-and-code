import 'info_classes/recipe.dart';
import 'info_classes/shop.dart';
import 'info_classes/guideline.dart';

class InfoLists {

  static List<Recipe> recipes = [ //recipes are from experience and time spent working in coffee shop
    Recipe("Coffee", ["Fill machine with water", "Insert filter", "Add grounds", "Turn on machine",
      "Wait while machine makes coffee", "Add cream and sugar (Optional)"], 1),
    Recipe("Iced Coffee", ["Fill coffee pot with ice", "Fill machine with water", "Insert filter",
      "Add regular amount of grounds", "Set machine to make half pot", "Wait while machine makes coffee",
      "Chill coffee", "Pour into cup with ice", "Add cream or sugar (Optional)"], 2),
    Recipe("Rich Brew", ["Fill machine with water", "Insert filter", "Add 1.5 times usual coffe grounds",
      "Turn on machine", "Wait while machine makes coffee", "Add cream and sugar (Optional)"], 1),
    Recipe("Latte", ["Pour milk into metallic pitcher", "Add flavorings to cup (Optional)",
      "Place cup under espresso machine and select number of shots", "While espresso is dispensing, steam milk",
      "Create foam (if desired) by steaming in top 2 inches of milk", "Pour steamed milk into cup with espresso and stir"], 1),
    Recipe("Iced Latte", ["Iced latte recipe"], 2),
    Recipe("Mocha", ["Mocha recipe"], 1),
    Recipe("Iced Mocha", ["Iced mocha recipe"], 2),
    Recipe("Americano", ["Americano recipe"], 1),
    Recipe("Cappuccino", ["Cappuccino recipe"], 1),
    Recipe("Macchiato", ["Macchiato recipe"], 1),
    Recipe("Iced Macchiato", ["Iced macchiato recipe"], 2),
    Recipe("Blended Coffee", ["Blended coffee recipe"], 2),
  ];

  static List<Recipe> favRecipes = [];

  static List<Shop> shops = [ //shops and information were found through Google Maps
    Shop("Northern Shores Coffee (in UMD)", ["2423 Kirby Dr", "7:30 AM - 4:00 PM Weekdays",
      "No", "No"], 2),
    Shop("Perk Place Coffee", ["1336 W Arrowhead Rd", "7:00 AM - 3:00 PM Daily",
      "No", "Yes"], 2),
    Shop("Starbucks", ["1002 Woodland Ave", "5:30 AM - 9:00 PM Daily",
      "Yes", "Yes"], 1),
    Shop("Caribou, Kenwood Ave", ["1515 Kenwood Ave", "6:00 AM - 6:00 PM Daily",
      "Yes", "Yes"], 1),
    Shop("Dunn Brothers Coffee", ["2401 London Rd", "6:30 AM - 6:00 PM Mon-Thurs\n"
        "7:00 AM - 6:00 PM Sat,Sun", "Yes", "Yes"], 1),
    Shop("Campus Fuse", ["1826 E 8th St", "7:00 AM - 1:00 PM Weekdays",
      "No", "No"], 2),
    Shop("Duluth Coffee Company", ["105 E Superior St", "7:00 AM - 2:00 PM Daily",
      "No", "No"], 2),
    Shop("Yellow Bike Coffee (in Fitger's Inn)", ["600 E Superior St", "8:00 AM - 2:00 PM Sun-Thurs\n"
        "8:00 AM - 4:00 PM Fri,Sat", "Yes", "Yes"], 2),
    Shop("Caribou, Woodland Ave", ["1600 Woodland Ave", "6:00 AM - 6:00 PM Daily",
      "Yes", "No"], 1),
  ];

  static List<Shop> favShops = [];

  static List<Guideline> guidelines = [

  ];

  static List<Guideline> favGuidelines = [];
}
