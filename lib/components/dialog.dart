import 'package:flutter/material.dart';

class AddNewRecipeDialog extends StatefulWidget {
  const AddNewRecipeDialog({super.key});

  @override
  State<AddNewRecipeDialog> createState() => _AddNewRecipeDialogState();
}

class _AddNewRecipeDialogState extends State<AddNewRecipeDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add item to pantry'),
      content: Text('Choose an item'),
      actions: [
        FilledButton(onPressed: null, child: Icon(Icons.cancel_outlined)),
        FilledButton(onPressed: null, child: Icon(Icons.add_outlined))
      ],
    );
    ;
  }
}
