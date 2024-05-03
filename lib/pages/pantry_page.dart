import 'package:flutter/material.dart';

class PantryPage extends StatefulWidget {
  const PantryPage({super.key});

  @override
  State<PantryPage> createState() => _PantryPageState();
}

class _PantryPageState extends State<PantryPage> {
  void addRecipe() {
    //functions
    void addItemToPantry() {}
    void cancelAdd() {
      setState(() {
        Navigator.of(context).pop();
      });
    }

    //dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('add item to pantry'),
          content: Column(
            children: [
              const SearchBar(
                leading: Icon(Icons.search),
                hintText: 'Tofu',
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: cancelAdd,
                      child: const Icon(Icons.cancel_outlined)),
                  ElevatedButton(
                      onPressed: addItemToPantry,
                      child: const Icon(Icons.save_outlined)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Pantry',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.grass),
            title: Text('Tofu'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onPressed: addRecipe,
        child: const Icon(Icons.add),
      ),
    );
  }
}
