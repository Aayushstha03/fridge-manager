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
  List<Ingredient> getIngredients() {
    // ingredients.sort((a, b) => a.name.length.compareTo(b.name.length));
    return ingredients;
  }

//list of current pantry contents
  List<Ingredient> currentPantry = [
    // Ingredient(name: 'Tofu', icon: const Icon(Icons.grass_rounded))
  ];
  List<Ingredient> getPantryContents() {
    return currentPantry;
  }

//list of all the recipes that we can cook
  List<Recipe> recipes = [tofuChilli, chimkenChilli];

  List<Recipe> getRecipes() {
    return recipes;
  }
//get all ingredients

  List<Recipe> possibleRecipes = [];

  List<Recipe> getPossibleRecipes() {
    return possibleRecipes;
  }

// pantry contents
  ///add item to pantry from list of ingredients
  void addToPantry(Ingredient item) {
    currentPantry.add(item);
    checkPossibleRecipes();
    notifyListeners();
  }

  //remove item from ingredients
  void removeFromPantry(Ingredient item) {
    currentPantry.remove(item);
    checkPossibleRecipes();
    notifyListeners();
  }

  //
  void checkPossibleRecipes() {
    bool possible = true;
    for (Recipe recipe in recipes) {
      possible = true;
      for (Ingredient item in recipe.primaryIngredients) {
        if (!(currentPantry.contains(item))) {
          possible = false; //cant make not enough primary ingredients
          if (possibleRecipes.contains(recipe)) {
            //removing the recipe from possible recipes if it was previously possible
            possibleRecipes.remove(recipe);
            notifyListeners(); //notify consumers
          }
        }
      }
      if (possible) {
        if (!(possibleRecipes.contains(recipe))) {
          possibleRecipes.add(recipe);
        }
        //recipe added to pissible recipe list
        notifyListeners();
      }
    }
  }
}
