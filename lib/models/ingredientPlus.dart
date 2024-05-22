import 'package:fridge_app/models/ingredient.dart';

// extends Ingredient

class IngredientPlus {
  final Ingredient ingredient;
  final DateTime dateAddToPantry;
  final Duration timeToExpire;

  IngredientPlus({
    required this.ingredient,
    required this.dateAddToPantry,
    required this.timeToExpire,
  });
}
