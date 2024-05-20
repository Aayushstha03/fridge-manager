//todo add menu bar that can navigate and present users with a settings page
//todo add optap functions for each card to open the respective page
//todo add different lists in the model provider to handle different lists
//todo add date field to the model to calculate expiry time of items in pantry

import 'package:flutter/material.dart';
import 'package:fridge_app/components/MyCard.dart';
import 'package:fridge_app/components/dialog.dart';
import 'package:fridge_app/components/myAppBar.dart';
import 'package:fridge_app/models/ingredient_model.dart';
import 'package:provider/provider.dart';

class PantryPage extends StatefulWidget {
  const PantryPage({super.key});

  @override
  State<PantryPage> createState() => _PantryPageState();
}

class _PantryPageState extends State<PantryPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Ingredients>(
      builder: (context, value, child) => Scaffold(
        appBar: const MyAppBar(title: 'Pantry'),
        drawer: const Drawer(
          child: Column(
            children: [],
          ),
        ),
        // ** this is the code that presents stuff in current pantry
        // body: ListView.builder(
        //   itemCount: value.currentPantry.length,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       leading: value.getPantryContents()[index].icon,
        //       title: Text(value.getPantryContents()[index].name),
        //       trailing: FilledButton(
        //         style: ButtonStyle(
        //           backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        //             (Set<MaterialState> states) {
        //               if (states.contains(MaterialState.pressed)) {
        //                 return Colors.red.withOpacity(0.5);
        //               }
        //               return Colors
        //                   .red.shade500; // Use the component's default.
        //             },
        //           ),
        //         ),
        //         onPressed: () {
        //           value.removeFromPantry(value.getPantryContents()[index]);
        //         },
        //         child: const Icon(Icons.delete),
        //       ),
        //     );
        //   },
        // ),
        // ** upto here
        // ** here im building the new demo homepage:)
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //red alert block
              MyCard(
                  color: Colors.red.shade900.withOpacity(0.5),
                  title: 'Expiring Immediately',
                  onTap: () {}),
              MyCard(
                  color: Colors.yellow.shade900.withOpacity(0.5),
                  title: 'Keep in mind',
                  onTap: () {}),
              MyCard(
                  color: Colors.green.shade900.withOpacity(0.5),
                  title: 'Good for now',
                  onTap: () {}),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewRecipeDialog(),
                ));
          },
          icon: const Icon(Icons.add),
          label: const Text('Add Item'),
        ),
      ),
    );
  }
}
