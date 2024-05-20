//todo add menu bar that can navigate and present users with a settings page

import 'package:flutter/material.dart';
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
              Card(
                color: Colors.red.shade900,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.white.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        textColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        title: const Text('A card that can be tapped'),
                        subtitle: const Text(
                            'This will display information about the number of items in pantry in red zone'),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.yellow.shade900,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.white.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        textColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        title: const Text('A card that can be tapped'),
                        subtitle: const Text(
                            'This will display information about the number of items in pantry in yelow zone'),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.green.shade900,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.white.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        textColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        title: const Text('A card that can be tapped'),
                        subtitle: const Text(
                            'This will display information about the number of items in pantry in oka chill zone'),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
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
