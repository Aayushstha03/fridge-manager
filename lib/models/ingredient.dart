import 'package:flutter/material.dart';

class Ingredient {
  final String name;
  final Icon icon;

  Ingredient({
    required this.name,
    required this.icon,
  });
}

Ingredient tofu = Ingredient(name: 'Tofu', icon: const Icon(Icons.grass));
Ingredient onion =
    Ingredient(name: 'Onion', icon: const Icon(Icons.grass_rounded));
Ingredient capsicum =
    Ingredient(name: 'Capsicum', icon: const Icon(Icons.grass_rounded));
Ingredient tomato =
    Ingredient(name: 'Tomato', icon: const Icon(Icons.grass_rounded));
Ingredient potato =
    Ingredient(name: 'Potato', icon: const Icon(Icons.grass_rounded));
Ingredient carrot =
    Ingredient(name: 'Carrot', icon: const Icon(Icons.grass_rounded));
Ingredient cucumber =
    Ingredient(name: 'Cucumber', icon: const Icon(Icons.grass_rounded));
Ingredient sweetPotato =
    Ingredient(name: 'Sweet Potato', icon: const Icon(Icons.grass_rounded));
Ingredient yam = Ingredient(name: 'Yam', icon: const Icon(Icons.grass_rounded));
Ingredient greenOnio =
    Ingredient(name: 'Green Onion', icon: const Icon(Icons.grass_rounded));
Ingredient chimken =
    Ingredient(name: 'Chicken', icon: const Icon(Icons.kebab_dining_outlined));
Ingredient sausage =
    Ingredient(name: 'Sausage', icon: const Icon(Icons.kebab_dining_outlined));
