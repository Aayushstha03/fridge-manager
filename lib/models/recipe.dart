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

Recipe tofuChilli = Recipe(
    name: 'Tofu Chilli',
    primaryIngredients: [tofu, onion, tomato],
    secondaryIngredients: [greenOnio],
    type: 'veggie');

Recipe chimkenChilli = Recipe(
    name: 'Chicken Chilli',
    primaryIngredients: [chimken, onion, tomato],
    secondaryIngredients: [greenOnio],
    type: 'veggie');
