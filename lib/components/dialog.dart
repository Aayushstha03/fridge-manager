import 'package:flutter/material.dart';
import 'package:fridge_app/models/ingredient.dart';
import 'package:fridge_app/models/ingredient_model.dart';
import 'package:provider/provider.dart';

class AddNewRecipeDialog extends StatefulWidget {
  const AddNewRecipeDialog({super.key});

  @override
  State<AddNewRecipeDialog> createState() => _AddNewRecipeDialogState();
}

class _AddNewRecipeDialogState extends State<AddNewRecipeDialog> {
  final TextEditingController itemController = TextEditingController();

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
        actions: const [
          FilledButton(onPressed: null, child: Icon(Icons.cancel_outlined)),
          FilledButton(onPressed: null, child: Icon(Icons.add_outlined))
        ],
      ),
    );
    ;
  }
}