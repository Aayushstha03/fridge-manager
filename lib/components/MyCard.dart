import 'package:flutter/material.dart';
import 'package:fridge_app/models/ingredient_model.dart';
import 'package:provider/provider.dart';

class MyCard extends StatefulWidget {
  final Color color;
  final String title;
  final void Function()? onTap;

  const MyCard(
      {super.key,
      required this.color,
      required this.title,
      required this.onTap});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Ingredients>(
      builder: (context, value, child) => Card(
        color: widget.color,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.white.withAlpha(30),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  textColor: Theme.of(context).colorScheme.onSecondaryContainer,
                  title: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    '${value.currentPantry.length} items\nIncluding:  ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                // const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
