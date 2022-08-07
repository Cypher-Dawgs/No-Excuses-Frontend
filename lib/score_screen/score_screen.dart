import 'dart:async';

import 'package:flutter/material.dart';
import 'package:no_excuses/home_screen/home_screen.dart';
import 'package:no_excuses/palette.dart';
import 'package:no_excuses/providers/provider.dart';
import 'package:provider/provider.dart';

class ScoreScreen extends StatefulWidget {
  static const routeName = "/score";

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Data>(context, listen: false);
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          SizedBox(
            height: 160,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png"),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your work-life balance score is",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/scoreDecorator.png"),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 5,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        prov.score.toString(),
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
