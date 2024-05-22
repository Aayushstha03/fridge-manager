import 'package:flutter/material.dart';
import 'package:fridge_app/components/myAppBar.dart';
import 'package:fridge_app/models/ingredient_model.dart';
import 'package:provider/provider.dart';

class MyListingPage extends StatefulWidget {
  final String title;
  const MyListingPage({super.key, required this.title});

  @override
  State<MyListingPage> createState() => _MyListingPageState();
}

class _MyListingPageState extends State<MyListingPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Ingredients>(
      builder: (context, value, child) => Scaffold(
        appBar: MyAppBar(title: widget.title),
        body: ListView.builder(
          itemCount: value.currentPantry.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: value.getPantryContents()[index].ingredient.icon,
              title: Text(value.getPantryContents()[index].ingredient.name),
              trailing: FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.red.shade900.withOpacity(0.5);
                      }
                      return Colors
                          .red.shade700; // Use the component's default.
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
      ),
    );
  }
}
