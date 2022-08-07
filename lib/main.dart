import 'package:flutter/material.dart';
import 'package:no_excuses/edit_profile_screen/edit_profile_screen.dart';
import 'package:no_excuses/home_screen/home_screen.dart';
import 'package:no_excuses/meal_screen/meal_screen.dart';
import 'package:no_excuses/providers/provider.dart';
import 'package:no_excuses/questions-screen/questions_screen.dart';
import 'package:no_excuses/score_screen/score_screen.dart';
import 'package:no_excuses/signup-screen/screens/login_screen.dart';
import 'package:no_excuses/signup-screen/screens/signup_screen.dart';
import 'package:no_excuses/splash_screen.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Data())],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
          routes: {
            SignUp.routeName: (ctx) => SignUp(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            QuestionsScreen.routeName: (ctx) => QuestionsScreen(),
            ScoreScreen.routeName: (ctx) => ScoreScreen(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
            MealScreen.routeName: (ctx) => MealScreen(),
            EditProfileScreen.routeName: (ctx) => EditProfileScreen(),
          }),
    );
  }
}
