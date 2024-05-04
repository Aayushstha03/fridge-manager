import 'package:flutter/material.dart';
import 'package:fridge_app/ingredient_model.dart';
import 'package:provider/provider.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Ingredient>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            'Recipes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: value.ingredients.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.grass_rounded),
              title: Text(value.getIngredients()[index]),
            );
          },
        ),
      ),
    );
  }
}
