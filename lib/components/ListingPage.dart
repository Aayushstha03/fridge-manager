import 'package:flutter/material.dart';
import 'package:fridge_app/components/myAppBar.dart';
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
    return Consumer(
      builder: (context, value, child) => Scaffold(
        appBar: MyAppBar(title: widget.title),
      ),
    );
  }
}
