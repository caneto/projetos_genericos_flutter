import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather/src/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds:1), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=>const HomeScreen()));
    });
    return  const Scaffold(
      body:SizedBox(
        height:double.infinity,
        child: Image(
            fit:BoxFit.cover,
            image:AssetImage('assets/splash.png')),
      ),
    );
  }
}
