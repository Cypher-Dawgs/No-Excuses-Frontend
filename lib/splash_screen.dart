import 'dart:async';

import 'package:flutter/material.dart';
import 'package:no_excuses/palette.dart';
import 'package:no_excuses/signup-screen/screens/signup_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
