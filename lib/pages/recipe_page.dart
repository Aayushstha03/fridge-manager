import 'package:flutter/material.dart';
import 'package:fridge_app/models/ingredient_model.dart';
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
            // if (value.getIngredients()[index].type == 'veggie') {
            //   String iconData = 'Icons.grass_rounded';
            // }
            return ListTile(
              // leading: const Icon(),
              title: Text(value.getIngredients()[index].name),
            );
          },
        ),
      ),
    );
  }
}
