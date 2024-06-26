//todo add menu bar that can navigate and present users with a settings page
//todo add optap functions for each card to open the respective page
//todo add different lists in the model provider to handle different lists
//todo add date field to the model to calculate expiry time of items in pantry

import 'package:flutter/material.dart';
import 'package:fridge_app/components/ListingPage.dart';
import 'package:fridge_app/components/MyCard.dart';
import 'package:fridge_app/components/Dialog.dart';
import 'package:fridge_app/components/MyAppBar.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //red alert block
              MyCard(
                color: Colors.red.shade900.withOpacity(0.5),
                title: 'Expiring Immediately',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyListingPage(
                                title: 'Expiring Immediately',
                              )));
                },
              ),
              MyCard(
                  color: Colors.yellow.shade900.withOpacity(0.5),
                  title: 'Keep in mind',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyListingPage(
                                  title: 'Keep in mind',
                                )));
                  }),
              MyCard(
                  color: Colors.green.shade900.withOpacity(0.5),
                  title: 'Good for now',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyListingPage(
                                  title: 'Good for now',
                                )));
                  }),
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
