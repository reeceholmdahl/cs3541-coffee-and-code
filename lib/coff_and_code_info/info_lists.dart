import 'info_classes/recipe.dart';
import 'info_classes/shop.dart';
import 'info_classes/guideline.dart';

class InfoLists {

  static List<Recipe> recipes = [
    Recipe("Coffee", "Coffee recipe", 1),
    Recipe("Iced Coffee", "Iced coffee recipe", 2),
    Recipe("Strong Cup", "Strong cup recipe", 1),
    Recipe("Latte", "Latte recipe", 1),
    Recipe("Iced Latte", "Iced latte recipe", 2),
    Recipe("Mocha", "Mocha recipe", 1),
    Recipe("Iced Mocha", "Iced mocha recipe", 2),
    Recipe("Americano", "Americano recipe", 1),
    Recipe("Iced Americano", "Iced americano recipe", 2),
    Recipe("Cappuccino", "Cappuccino recipe", 1),
    Recipe("Macchiato", "Macchiato recipe", 1),
    Recipe("Iced Macchiato", "Iced macchiato recipe", 2),
    Recipe("Blended Coffee", "Blended coffee recipe", 2),
  ];

  static List<Recipe> favRecipes = [];

  static List<Shop> shops = [
    Shop("starbucks", "coffee", 1)

  ];

  static List<Shop> favShops = [];

  static List<Guideline> guidelines = [

  ];

  static List<Guideline> favGuidelines = [];
}
