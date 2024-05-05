import 'package:flutter/material.dart';
import 'package:fridge_app/models/ingredient.dart';
import 'package:fridge_app/models/recipe.dart';

class Ingredients extends ChangeNotifier {
  //list of ingredients
  List<Ingredient> ingredients = [
    tofu,
    onion,
    capsicum,
    carrot,
    chimken,
    sausage,
    greenOnio,
    tomato,
    potato,
    cucumber,
    sweetPotato,
    yam,
  ];
//list of current pantry contents
  List<Ingredient> currentPantry = [
    // Ingredient(name: 'Tofu', icon: const Icon(Icons.grass_rounded))
  ];

  List<Recipe> recipes = [];
//get all ingredients
  List<Ingredient> getIngredients() {
    // ingredients.sort((a, b) => a.name.length.compareTo(b.name.length));
    return ingredients;
  }

// pantry contents
  List<Ingredient> getPantryContents() {
    return currentPantry;
  }

  ///add item to pantry from list of ingredients
  void addToPantry(Ingredient item) {
    currentPantry.add(item);
    notifyListeners();
  }

  //remove item from ingredients
  void removeFromPantry(Ingredient item) {
    currentPantry.remove(item);
    notifyListeners();
  }
}
