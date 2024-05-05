//todo add menu bar that can navigate and present users with a settings page

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
        return const AddNewRecipeDialog();
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
          leading:
              GestureDetector(onTap: () {}, child: Icon(Icons.menu_rounded)),
        ),
        body: ListView.builder(
          itemCount: value.currentPantry.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: value.getPantryContents()[index].icon,
              title: Text(value.getPantryContents()[index].name),
              trailing: FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.red.withOpacity(0.5);
                      }
                      return Colors
                          .red.shade500; // Use the component's default.
                    },
                  ),
                ),
                onPressed: () {
                  value.removeFromPantry(value.getPantryContents()[index]);
                },
                child: const Icon(Icons.delete),
              ),
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
