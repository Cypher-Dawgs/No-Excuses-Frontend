import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';

class Data extends ChangeNotifier {
  late double fruitsCounter, stressCounter, placesCounter, peopleCounter, interactCounter, socialCounter, achievementsCounter;
  late double moneyCounter, todoCounter, flowCounter, stepsCounter, visionCounter, sleepCounter;
  late double vacationCounter, shoutCounter, recognitionCounter, passionCounter, thinkCounter;
  late int genderSelector, incomeSelector;
  late double bmi;
  late int bmif = 0;

  late String token;
  late String username;
  late String email;

  late List breakfast;
  late List lunch;
  late List snacks;
  late List dinner;
  late List excercises;

  late int breakfastCal = 0;
  late int lunchCal = 0;
  late int snacksCal = 0;
  late int dinnerCal = 0;

  late String score;

  Future<void> setValues(int uheight, int uweight, double a, double b, double c, double d, double e, double f, double g, double h, double i, double j, double k, double l, double m, double n, double o, double p, double q, double r, int s, int t) async {
    bmi = uweight / ((uheight * uheight) / (100 * 100));
    if (bmi < 25)
      bmif = 1;
    else
      bmif = 2;
    fruitsCounter = a;
    stressCounter = b;
    placesCounter = c;
    peopleCounter = d;
    interactCounter = e;
    achievementsCounter = f;
    socialCounter = g;
    moneyCounter = h;
    todoCounter = i;
    flowCounter = j;
    stepsCounter = k;
    visionCounter = l;
    sleepCounter = m;
    vacationCounter = n;
    shoutCounter = o;
    recognitionCounter = p;
    passionCounter = q;
    thinkCounter = r;
    genderSelector = s;
    incomeSelector = t;
    await getScore();
  }
// 1 - sad
// 2 - happy

// 0 - male
// 1 - female
  Future<void> getScore() async {
    final String url = "https://no-excuses-api.herokuapp.com/?FRUITS_VEGGIES=" +
        fruitsCounter.toString() +
        "&DAILY_STRESS=" +
        stressCounter.toString() +
        "&PLACES_VISITED=" +
        placesCounter.toString() +
        "&CORE_CIRCLE=" +
        peopleCounter.toString() +
        "&SUPPORTING_OTHERS=" +
        socialCounter.toString() +
        "&SOCIAL_NETWORK=" +
        interactCounter.toString() +
        "&ACHIEVEMENT=" +
        achievementsCounter.toString() +
        "&DONATION=" +
        moneyCounter.toString() +
        "&BMI_RANGE=" +
        bmif.toString() +
        "&TODO_COMPLETED=" +
        todoCounter.toString() +
        "&FLOW=" +
        flowCounter.toString() +
        "&DAILY_STEPS=" +
        stepsCounter.toString() +
        "&LIVE_VISION=" +
        visionCounter.toString() +
        "&SLEEP_HOURS=" +
        sleepCounter.toString() +
        "&LOST_VACATION=" +
        vacationCounter.toString() +
        "&DAILY_SHOUTING=" +
        shoutCounter.toString() +
        "&SUFFICIENT_INCOME=" +
        (incomeSelector + 1).toString() +
        "&PERSONAL_AWARDS=" +
        recognitionCounter.toString() +
        "&TIME_FOR_PASSION=" +
        passionCounter.toString() +
        "&WEEKLY_MEDITATION=" +
        thinkCounter.toString() +
        "&GENDER=" +
        genderSelector.toString();
    print(url);
    final response = await http.get(Uri.parse(url));
    var temp = json.decode(response.body);
    score = temp["prediction"].split('.')[0];
    final url2 = "http://192.168.56.1:8001/api/user/sendScore";
    final response2 = await http.post(Uri.parse(url2), body: {
      "email": email,
      "score": score,
    });
    print(response2.body);
  }
//600 - 700 = 0

  Future<void> getMeals() async {
    String url = "http://192.168.56.1:8001/api/user/getMeals/?range=0";
    final response = await http.get(Uri.parse(url));
    breakfast = json.decode(response.body)["meal"]["dietPlan"][0]["meal"];
    for (int i = 0; i < breakfast.length; i++) {
      breakfastCal = breakfastCal + int.parse(breakfast[i]["mealCal"].toString());
    }
    lunch = json.decode(response.body)["meal"]["dietPlan"][1]["meal"];
    for (int i = 0; i < lunch.length; i++) {
      lunchCal = lunchCal + int.parse(lunch[i]["mealCal"].toString());
    }
    snacks = json.decode(response.body)["meal"]["dietPlan"][2]["meal"];
    for (int i = 0; i < snacks.length; i++) {
      snacksCal = snacksCal + int.parse(snacks[i]["mealCal"].toString());
    }
    dinner = json.decode(response.body)["meal"]["dietPlan"][3]["meal"];
    for (int i = 0; i < dinner.length; i++) {
      dinnerCal = dinnerCal + int.parse(dinner[i]["mealCal"].toString());
    }
    excercises = json.decode(response.body)["meal"]["exercisePlan"];
    print(excercises);
  }
}
