// // todo add page that displays recipe details!
//todo add a search bar to search all recipes and get the necessary ingredients
//todo add better ui?

//* todo very very late game
// todo add search and sort filters between breakfast,lunch,snack,dinner
// todo veggies, meat and whatnots too pachi tara

import 'package:flutter/material.dart';
import 'package:fridge_app/components/myAppBar.dart';
import 'package:fridge_app/models/ingredient_model.dart';
import 'package:fridge_app/pages/recipe_details_page.dart';
import 'package:provider/provider.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Ingredients>(
      builder: (context, value, child) => Scaffold(
        appBar: const MyAppBar(title: 'Recipes'),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            const Text('Possible Recipes',
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                )),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: value.possibleRecipes.length,
              itemBuilder: (context, index) {
                // if (value.getIngredients()[index].type == 'veggie') {
                //   String iconData = 'Icons.grass_rounded';
                // }
                return ListTile(
                  leading: const Icon(Icons.restaurant_menu_rounded),
                  title: Text(value.getPossibleRecipes()[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailsPage(
                            recipe: value.getPossibleRecipes()[index]),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            const Text('All recipes',
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                )),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: value.recipes.length,
              itemBuilder: (context, index) {
                // if (value.getIngredients()[index].type == 'veggie') {
                //   String iconData = 'Icons.grass_rounded';
                // }
                return ListTile(
                  leading: const Icon(Icons.restaurant_menu_rounded),
                  title: Text(value.getRecipes()[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailsPage(
                            recipe: value.getRecipes()[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
