import 'package:flutter/material.dart';
import 'package:fridge_app/models/ingredient.dart';

class Ingredients extends ChangeNotifier {
  //list of ingredients
  List<Ingredient> ingredients = [
    Ingredient(name: 'Tofu', type: 'veggie'),
    Ingredient(name: 'Onion', type: 'veggie'),
    Ingredient(name: 'Capsicum', type: 'veggie'),
    Ingredient(name: 'Tomato', type: 'veggie'),
    Ingredient(name: 'Chicken', type: 'meat'),
    Ingredient(name: 'Apple', type: 'fruit'),
  ];
//list of current pantry contents
  List<Ingredient> currentPantry = [];

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
