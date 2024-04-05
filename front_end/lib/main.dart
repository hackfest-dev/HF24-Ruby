import 'package:flutter/material.dart';
import 'splash.dart'; // Import splash screen
import 'login.dart'; // Import login screen
import 'signup.dart'; // Import signup screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello World Demo Application',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: '/splash', // Set initial route to splash screen
      routes: {
        '/splash': (context) => const Splash(), // Define route for splash screen
        '/login': (context) => LoginScreen(), // Define route for login screen
        '/signup': (context) => SignUpScreen(), // Define route for signup screen
      },
    );
  }
}
