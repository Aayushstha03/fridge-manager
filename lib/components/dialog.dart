import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fridge_app/models/ingredient.dart';
import 'package:fridge_app/models/ingredient_model.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

class AddNewRecipeDialog extends StatefulWidget {
  const AddNewRecipeDialog({super.key});

  @override
  State<AddNewRecipeDialog> createState() => _AddNewRecipeDialogState();
}

class _AddNewRecipeDialogState extends State<AddNewRecipeDialog> {
  final TextEditingController itemController = TextEditingController();

  //get location to AppData directory assigned by the OS to the app
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<List> readPantryContents() async {
    // try {
    //   final file = await _localFile;
    //   // Read the file
    //   final contents = await file.readAsString();
    //   return contents;
    //   return int.parse(contents);
    // } catch (e) {
    //   // If encountering an error, return 0
    //   return 0;
    // }

    final file = await _localFile;
    // Read the file
    final contents = await file.readAsLines();
    return contents;
  }

  Future<File> writePantryContents(List<Ingredient> pantryContents) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('$pantryContents');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Ingredients>(
      builder: (context, value, child) => AlertDialog(
        title: const Text('Add item to pantry'),
        content: Column(
          children: [
            const Text('Select item to add'),
            DropdownMenu(
              controller: itemController,
              requestFocusOnTap: true,
              enableFilter: true,
              enableSearch: true,
              dropdownMenuEntries: value
                  .getIngredients()
                  .map<DropdownMenuEntry<Ingredient>>((Ingredient item) {
                return DropdownMenuEntry<Ingredient>(
                    value: item, label: item.name, leadingIcon: item.icon);
              }).toList(),
            ),
            Text('You selected ${itemController.text}'),
          ],
        ),
        actions: [
          FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.cancel_outlined)),
          FilledButton(
              onPressed: () {
                Ingredient toAdd = value.getIngredients().firstWhere(
                    (element) => element.name == itemController.text);

                if (value.getPantryContents().contains(toAdd) == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      showCloseIcon: true,
                      closeIconColor: Colors.black,
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      content: const Text(
                        'Item already in Pantry!',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                } else {
                  value.addToPantry(toAdd);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      showCloseIcon: true,
                      closeIconColor: Colors.black,
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      content: const Text(
                        'Item successfully added to Pantry!',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                }
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.add_outlined))
        ],
      ),
    );
  }
}
