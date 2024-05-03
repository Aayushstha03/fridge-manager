import 'package:flutter/material.dart';
import 'package:fridge_app/ingredient_model.dart';
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
    return Consumer<Ingredient>(
      builder: (context, value, child) => Container(
        child: Column(
          children: [
            SearchBar(
              leading: Icon(Icons.search_rounded),
              onChanged: (p) {
                setState(() {
                  searchResults = value.ingredients
                      .where((item) =>
                          item.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                });
              },
            ),
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
