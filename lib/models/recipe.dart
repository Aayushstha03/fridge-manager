import 'package:fridge_app/models/ingredient.dart';

class Recipe {
  final String name;
  final List<Ingredient> primaryIngredients;
  final List<Ingredient> secondaryIngredients;
  final String type;

  Recipe({
    required this.name,
    required this.primaryIngredients,
    required this.secondaryIngredients,
    required this.type,
  });
}
