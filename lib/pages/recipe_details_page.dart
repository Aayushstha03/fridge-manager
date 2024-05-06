import 'package:flutter/material.dart';
import 'package:fridge_app/models/recipe.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Recipe Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text(
                recipe.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.access_time_outlined),
                    SizedBox(width: 5),
                    Text(
                      'recipe.timeToCook',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                Text(
                  'Type : ${recipe.getType()}',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            const Text('Ingredients required:'),
            ListView.builder(
              itemCount: recipe.getPrimaryIngredients().length,
              itemBuilder: (context, index) {},
            )
          ],
        ),
      ),
    );
  }
}
