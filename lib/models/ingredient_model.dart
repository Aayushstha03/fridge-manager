import 'package:flutter/material.dart';
import 'package:fridge_app/models/ingredient.dart';

class Ingredients extends ChangeNotifier {
  //list of ingredients
  List<Ingredient> ingredients = [
    Ingredient(name: 'Tofu', icon: 'grass_rounded'),
    Ingredient(name: 'Onion', icon: 'grass_rounded'),
    Ingredient(name: 'Capsicum', icon: 'grass_rounded'),
    Ingredient(name: 'Tomato', icon: 'grass_rounded'),
    Ingredient(name: 'Potato', icon: 'grass_rounded'),
    Ingredient(name: 'Carrot', icon: 'grass_rounded'),
    Ingredient(name: 'Cucumber', icon: 'grass_rounded'),
    Ingredient(name: 'Sweet Potato', icon: 'grass_rounded'),
    Ingredient(name: 'Yam', icon: 'grass_rounded'),
    Ingredient(name: 'Green Onion', icon: 'grass_rounded'),
    Ingredient(name: 'Chicken', icon: 'kebab_dining_outlined'),
  ];
//list of current pantry contents
  List<Ingredient> currentPantry = [
    Ingredient(name: 'Tofu', icon: 'grass_rounded')
  ];

//get all ingredients
  List<Ingredient> getIngredients() {
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
