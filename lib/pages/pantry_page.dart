import 'package:flutter/material.dart';
import 'package:fridge_app/components/dialog.dart';
import 'package:fridge_app/models/ingredient_model.dart';
import 'package:provider/provider.dart';

class PantryPage extends StatefulWidget {
  const PantryPage({super.key});

  @override
  State<PantryPage> createState() => _PantryPageState();
}

class _PantryPageState extends State<PantryPage> {
  void addRecipe() {
    //functions
    //dialog
    showDialog(
      context: context,
      builder: (context) {
        return AddNewRecipeDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Ingredients>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            'Pantry',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: value.currentPantry.length,
          itemBuilder: (context, index) {
            return ListTile(
              // leading: Icon(Icons.Text(value.getPantryContents()[index].icon)),
              title: Text(value.getPantryContents()[index].name +
                  '(' +
                  value.getPantryContents()[index].icon +
                  ')'),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          onPressed: addRecipe,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
