import 'package:flutter/material.dart';
import 'CustomDrawer/buildDrawer.dart';

void main(List<String> args) {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrawerBuild(),
    );
  }
}
