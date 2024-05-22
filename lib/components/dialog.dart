// // completed todo null safety, disable the save button if the dropdown bar is empty

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fridge_app/components/myAppBar.dart';
import 'package:fridge_app/models/ingredient.dart';
import 'package:fridge_app/models/ingredientPlus.dart';
import 'package:fridge_app/models/ingredient_model.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

class AddNewRecipeDialog extends StatefulWidget {
  const AddNewRecipeDialog({super.key});

  @override
  State<AddNewRecipeDialog> createState() => _AddNewRecipeDialogState();
}

class _AddNewRecipeDialogState extends State<AddNewRecipeDialog> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController itemController = TextEditingController();
  TextEditingController purchaseDateController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController expiryDurationController = TextEditingController();
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

  Future<void> _selectPurchaseDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        FocusManager.instance.primaryFocus?.unfocus();
        purchaseDateController.text =
            selectedDate.toLocal().toString().split(' ')[0];
      });
    }
  }

  Future<void> _selectExpiryDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        FocusManager.instance.primaryFocus?.unfocus();
        expiryDateController.text =
            selectedDate.toLocal().toString().split(' ')[0];
      });
    }
    expiryDurationController.text =
        '${int.parse(expiryDateController.text.substring(8, 10)) - int.parse(purchaseDateController.text.substring(8, 10))} days';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Ingredients>(
      builder: (context, value, child) => Scaffold(
        appBar: const MyAppBar(title: 'Add item to pantry'),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                DropdownMenu(
                  label: const Text('Item Name'),
                  expandedInsets: const EdgeInsets.all(0),
                  leadingIcon: const Icon(Icons.search_outlined),
                  hintText: 'Select an item from the list',
                  width: null,
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
                const SizedBox(height: 10),

                TextField(
                  keyboardType: TextInputType.none,
                  readOnly: true,
                  controller: purchaseDateController,
                  onTap: () => {_selectPurchaseDate(context)},
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today_outlined),
                    labelText: 'Purchase Date',
                    hintText: 'yyyy-mm-dd',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                TextField(
                  keyboardType: TextInputType.none,
                  readOnly: true,
                  controller: expiryDateController,
                  onTap: () => {_selectExpiryDate(context)},
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today_outlined),
                    labelText: 'Expiry Date',
                    hintText: 'yyyy-mm-dd',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                TextField(
                  controller: expiryDurationController,
                  canRequestFocus: false,
                  enableInteractiveSelection: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.timer_outlined),
                    labelText: 'Expiring after',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                //action buttons
              ],
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              heroTag: null,
              onPressed: () => {Navigator.of(context).pop()},
              label: const Text('Cancel'),
              icon: const Icon(Icons.arrow_back_outlined),
            ),
            const SizedBox(height: 10),
            FloatingActionButton.extended(
                heroTag: null,
                onPressed: () {
                  if (itemController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Durations.short4,
                      showCloseIcon: true,
                      closeIconColor: Colors.white,
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      content: const Text(
                        'No Item Selected!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ));
                    return;
                  }

                  Ingredient toAdd = value.getIngredients().firstWhere(
                      (element) => element.name == itemController.text);

                  // IngredientPlus(ingredient: toAdd, dateAddToPantry: dateAddToPantry, timeToExpire: timeToExpire) toCheck;
                  if (value.getPantryContents().contains(toAdd) == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Durations.long1,
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
                    value.addToPantry(IngredientPlus(
                        ingredient: toAdd,
                        dateAddToPantry: DateTime.now(),
                        timeToExpire: Durations.extralong4));
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
                label: const Text('Save'),
                icon: const Icon(Icons.save_outlined)),
          ],
        ),
      ),
    );
  }
}
