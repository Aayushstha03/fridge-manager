import 'package:flutter/material.dart';
import 'package:fridge_app/models/ingredient_model.dart';
import 'package:provider/provider.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  String query = '';
  List<String> searchResults = [];

  void addItemToPantry() {}
  void cancelAdd() {
    setState(() {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Ingredients>(
      builder: (context, value, child) => Container(
        child: Column(
          children: [
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton(
                    onPressed: cancelAdd,
                    child: const Icon(Icons.cancel_outlined)),
                FilledButton(
                    onPressed: addItemToPantry,
                    child: const Icon(Icons.save_outlined)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
