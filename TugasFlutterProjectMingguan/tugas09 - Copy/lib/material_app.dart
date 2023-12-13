import 'package:flutter/material.dart';
import './material_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}
