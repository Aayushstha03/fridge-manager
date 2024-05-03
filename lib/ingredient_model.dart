import 'package:flutter/material.dart';

class Ingredient extends ChangeNotifier {
  List<String> ingredients = [
    'Tofu',
    'Onion',
    'Capsicum',
    'Tomato',
  ];

  List<String> currentPantry = [];

  void addToPantry(String food) {
    currentPantry.add(food);
    notifyListeners();
  }

  List<String> getIngredients() {
    return ingredients;
  }

  List<String> getPantryContents() {
    return currentPantry;
  }
}
