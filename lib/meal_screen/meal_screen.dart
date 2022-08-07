import 'package:flutter/material.dart';
import 'package:no_excuses/home_screen/drawer.dart';
import 'package:no_excuses/palette.dart';
import 'package:no_excuses/providers/provider.dart';
import 'package:provider/provider.dart';

class MealScreen extends StatefulWidget {
  static const routeName = "/meals";

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late List data = [];
  int curr = 0;

  String mealName = "";
  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route == null)
      return SizedBox(height: 1);
    else {
      final routeArgs = route.settings.arguments as Map<String, dynamic>;
      mealName = routeArgs["name"]!;
      if (mealName == "Breakfast")
        data = Provider.of<Data>(context, listen: false).breakfast;
      else if (mealName == "Lunch")
        data = Provider.of<Data>(context, listen: false).lunch;
      else if (mealName == "Snacks")
        data = Provider.of<Data>(context, listen: false).snacks;
      else if (mealName == "Dinner") data = Provider.of<Data>(context, listen: false).dinner;
    }
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
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
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: (() {
                        Navigator.of(context).pop();
                      }),
                      child: Image.asset("assets/images/back.png")),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    mealName,
                    style: style(20, Colors.white, false),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(360),
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.network(
                                data[curr]["mealUrl"],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data[curr]["mealName"],
                            style: style(15, Colors.white, true),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "1 serving",
                            style: style(12, Colors.white, false),
                          ),
                          Container(
                            height: 30,
                            child: VerticalDivider(
                              color: primaryColor,
                              thickness: 1,
                              width: 80,
                            ),
                          ),
                          Text(
                            data[curr]["mealCal"].toString() + " cal",
                            style: style(12, Colors.white, false),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "Ingredients",
                style: style(20, primaryColor, true),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "per serving",
                style: style(12, Colors.white, false),
              ),
              SizedBox(
                height: 20,
              ),
              ...data[curr]["ingredients"].map((e) {
                return Row(
                  children: [
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      e,
                      style: style(15, Colors.white, false),
                    )
                  ],
                );
              }),
              SizedBox(
                height: 20,
              ),
              Text(
                "Instructions",
                style: style(20, primaryColor, true),
              ),
              SizedBox(
                height: 20,
              ),
              ...data[curr]["instructions"].map((e) {
                return Row(
                  children: [
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      e,
                      style: style(15, Colors.white, false),
                    )
                  ],
                );
              }),
              SizedBox(
                height: 20,
              ),
              Text(
                "Don't like this recipe? ",
                style: style(15, Colors.white, false),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        if (curr > 0) curr--;
                      });
                    }),
                    child: Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: curr == 0 ? deactivatedPrimaryColor : primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 12,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "previous recipe",
                            style: style(12, Colors.black, false),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        if (curr < data.length - 1) curr++;
                      });
                    }),
                    child: Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: curr == data.length - 1 ? deactivatedPrimaryColor : primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "another recipe",
                            style: style(12, Colors.black, false),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle style(double size, Color color, bool isbold) {
    return TextStyle(
      fontFamily: "Poppins",
      color: color,
      fontSize: size,
      fontWeight: isbold ? FontWeight.bold : null,
    );
  }
}
