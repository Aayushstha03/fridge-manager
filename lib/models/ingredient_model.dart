import 'package:flutter/material.dart';
import 'package:fridge_app/models/ingredient.dart';

class Ingredients extends ChangeNotifier {
  List<Ingredient> ingredients = [
    Ingredient(name: 'Tofu', type: 'veggie'),
    Ingredient(name: 'Onion', type: 'veggie'),
    Ingredient(name: 'Capsicum', type: 'veggie'),
    Ingredient(name: 'Tomato', type: 'veggie'),
    Ingredient(name: 'Chicken', type: 'meat'),
    Ingredient(name: 'Apple', type: 'fruit'),
  ];

  List<Ingredient> currentPantry = [];

  void addToPantry(String name, String type) {
    currentPantry.add(Ingredient(name: name, type: type));
    notifyListeners();
  }

  List<Ingredient> getIngredients() {
    return ingredients;
  }

  List<Ingredient> getPantryContents() {
    return currentPantry;
  }
}
