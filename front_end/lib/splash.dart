import 'package:ambulance/login.dart';

import 'package:flutter/material.dart';
import 'dart:async';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}


class _SplashState extends State<Splash> {

  void initState() {
    super.initState();
   
    Timer(const Duration(seconds: 4), () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     body: Center(
          child: Image.asset(
            'assets/giff.gif', 
            width: 380, 
            height: 380, 
           
          ),
        ), 
    );
  }
}