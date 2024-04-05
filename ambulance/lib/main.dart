import 'package:flutter/material.dart';
import 'package:ambulance/map_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ambulance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapRoute(), // Use MapRoute as the home page
    );
  }
}
