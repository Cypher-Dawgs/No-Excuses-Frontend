import 'package:flutter/material.dart';
import 'package:no_excuses/home_screen/drawer.dart';
import 'package:no_excuses/meal_screen/meal_screen.dart';
import 'package:no_excuses/palette.dart';
import 'package:no_excuses/providers/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool isLoading = true;

  late List<dynamic> data;
  List<Map<String, dynamic>> mealData = [
    {
      "name": "Breakfast",
      "calories": "507",
    },
    {
      "name": "Lunch",
      "calories": "601",
    },
    {
      "name": "Snacks",
      "calories": "200",
    },
    {
      "name": "Dinner",
      "calories": "722",
    }
  ];
  String selected = "workout";

  void initialiseData() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<Data>(context, listen: false).getMeals();
    data = Provider.of<Data>(context, listen: false).excercises;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    initialiseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(),
      backgroundColor: bgColor,
      body: isLoading
          ? Center(
              child: Image.asset("assets/images/logo.png"),
            )
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          child: Container(
                            height: 15,
                            child: Image.asset("assets/images/drawer.png"),
                          ),
                        ),
                        Container(
                          height: 20,
                          child: Image.asset("assets/images/notification.png"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = "diet";
                            });
                          },
                          child: Container(
                            width: 170,
                            child: selected == "diet"
                                ? Image.asset(
                                    "assets/images/yourDietPlanSelected.png",
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/images/yourDietPlanUnselected.png",
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = "workout";
                            });
                          },
                          child: Container(
                            width: 170,
                            child: selected == "workout"
                                ? Image.asset(
                                    "assets/images/yourWorkoutPlanSelected.png",
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/images/yourWorkoutPlanUnselected.png",
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    if (selected == "workout")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your workout plan", style: style(20, primaryColor)),
                          Text("let's get you in shape right away", style: style(15, Colors.white)),
                          SizedBox(
                            height: 20,
                          ),
                          ...data.map((e) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(43, 43, 43, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(width: 100, height: 60, child: Image.network(e["exerciseUrl"])),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e["exerciseName"],
                                            style: style(20, Colors.white),
                                          ),
                                          Text(
                                            e['exerciseTime'].toString() + " mins",
                                            style: style(12, Colors.white),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("assets/images/calorie.png"),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            e["burntCals"].toString() + " cals burnt",
                                            style: style(10, Colors.white),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset("assets/images/clock.png"),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            e["restTime"].toString() + " mins break",
                                            style: style(10, Colors.white),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          })
                        ],
                      ),
                    if (selected == "diet")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your diet plan", style: style(20, primaryColor)),
                          Text("a perfectly balanced diet for you", style: style(15, Colors.white)),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Table(
                              border: TableBorder.all(color: Color.fromRGBO(41, 41, 41, 1)),
                              children: [
                                TableRow(children: [
                                  Container(
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              height: 50 * 0.9,
                                              child: Image.asset(
                                                "assets/images/wave.png",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 50,
                                                child: Image.asset("assets/images/carbs.png"),
                                              ),
                                              Text(
                                                "carbs 20%",
                                                style: style(12, Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              height: 50 * 0.9,
                                              child: Image.asset(
                                                "assets/images/wave.png",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 50,
                                                child: Image.asset("assets/images/proteins.png"),
                                              ),
                                              Text(
                                                "proteins 50%",
                                                style: style(12, Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              height: 50 * 0.9,
                                              child: Image.asset(
                                                "assets/images/wave.png",
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 50,
                                                child: Image.asset(
                                                  "assets/images/fats.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                "fats 30%",
                                                style: style(12, Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Daily carbohydrates",
                                style: style(15, Colors.white),
                              )
                            ],
                          ),
                          Image.asset("assets/images/graph.png"),
                          SizedBox(
                            height: 10,
                          ),
                          ...mealData.map((e) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  MealScreen.routeName,
                                  arguments: {
                                    "name": e["name"],
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(43, 43, 43, 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Image.asset("assets/images/${e['name']}.png"),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e["name"],
                                          style: style(15, Colors.white),
                                        ),
                                        if (e["name"] == "Breakfast")
                                          Text(
                                            Provider.of<Data>(context, listen: false).breakfastCal.toString() + " calories",
                                            style: style(20, Colors.white),
                                          ),
                                        if (e["name"] == "Lunch")
                                          Text(
                                            Provider.of<Data>(context, listen: false).lunchCal.toString() + " calories",
                                            style: style(20, Colors.white),
                                          ),
                                        if (e["name"] == "Snacks")
                                          Text(
                                            Provider.of<Data>(context, listen: false).snacksCal.toString() + " calories",
                                            style: style(20, Colors.white),
                                          ),
                                        if (e["name"] == "Dinner")
                                          Text(
                                            Provider.of<Data>(context, listen: false).dinnerCal.toString() + " calories",
                                            style: style(20, Colors.white),
                                          )
                                      ],
                                    ),
                                    Spacer(),
                                    Image.asset("assets/images/rightArrow.png")
                                  ],
                                ),
                              ),
                            );
                          })
                        ],
                      )
                  ],
                ),
              ),
            ),
    );
  }

  TextStyle style(double size, Color color) {
    return TextStyle(
      fontFamily: "Poppins",
      color: color,
      fontSize: size,
    );
  }
}
