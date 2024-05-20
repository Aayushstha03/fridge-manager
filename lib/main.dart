import 'package:flutter/material.dart';
import 'package:fridge_app/models/ingredient_model.dart';
import 'package:fridge_app/pages/pantry_page.dart';
import 'package:fridge_app/pages/recipe_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Ingredients(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fridge App',
      // light theme settings
      // ** will not have light mode!
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
      //   useMaterial3: true,
      // ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple,
      ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  final List<Widget> pages = [
    const PantryPage(),
    const RecipePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: NavigationBar(
        // backgroundColor: Theme.of(context).colorScheme.background,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        // indicatorColor: Theme.of(context).focusColor,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.kitchen_rounded),
            label: 'Pantry',
          ),
          NavigationDestination(
            icon: Icon(Icons.fastfood_outlined),
            label: 'Recipes',
          ),
        ],
      ),
    );
  }
}
