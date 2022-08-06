import 'package:flutter/material.dart';
import 'package:no_excuses/palette.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class QuestionsScreen extends StatefulWidget {
  static const routeName = "/questions";

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final TextEditingController heightController = new TextEditingController();
  final TextEditingController weightController = new TextEditingController();
  final TextEditingController ageController = new TextEditingController();

  int selectedPage = 0;
  // RangeValues _currentRangeValues = const RangeValues(1, 5);
  double fruitsCounter = 0, stressCounter = 0, placesCounter = 0, peopleCounter = 0, interactCounter = 0, achievementsCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.05), BlendMode.dstATop),
            child: Align(
              child: Image.asset("assets/images/logo.png"),
              alignment: Alignment.center,
            ),
          ),
          Column(
            children: [
              if (selectedPage == 0)
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 60,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Just a few questions to help us\n determine your work life balance !!",
                                    textAlign: TextAlign.center,
                                    style: style(18, false, primaryColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Height",
                                style: style(15, false, primaryColor),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              textField(heightController, "Enter your height in cms", false),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Weight",
                                style: style(15, false, primaryColor),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              textField(weightController, "Enter your weight in kgs", false),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Age",
                                        style: style(15, false, primaryColor),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(43, 43, 43, 1),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              // crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 50,
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Center(
                                                    child: TextField(
                                                      expands: false,
                                                      style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                      ),
                                                      decoration: InputDecoration.collapsed(
                                                        hintText: "18",
                                                        hintStyle: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 12,
                                                          color: Color.fromRGBO(140, 140, 140, 1),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Image.asset("assets/images/up.png"),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Image.asset("assets/images/down.png"),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Years",
                                            style: style(15, false, Colors.white),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Gender",
                                        style: style(15, false, primaryColor),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(43, 43, 43, 1),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              // crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 70,
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Center(
                                                    child: TextField(
                                                      expands: false,
                                                      style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                      ),
                                                      decoration: InputDecoration.collapsed(
                                                        hintText: "Male",
                                                        hintStyle: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 12,
                                                          color: Color.fromRGBO(140, 140, 140, 1),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Image.asset("assets/images/up.png"),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Image.asset("assets/images/down.png"),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "How many fruits or vegetables do you eat everyday(servings per day)?",
                                style: style(15, false, primaryColor),
                              ),
                              SfSliderTheme(
                                data: SfSliderThemeData(
                                  inactiveTickColor: Colors.white,
                                  activeTickColor: Colors.white,
                                  activeLabelStyle: sliderStyle(),
                                  inactiveLabelStyle: sliderStyle(),
                                ),
                                child: SfSlider(
                                  min: 0,
                                  max: 5,
                                  value: fruitsCounter,
                                  interval: 1,
                                  stepSize: 1,
                                  showTicks: true,
                                  showLabels: true,
                                  enableTooltip: true,
                                  activeColor: primaryColor,
                                  minorTicksPerInterval: 1,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      fruitsCounter = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "How much stressed do you typically feel everyday?",
                                style: style(15, false, primaryColor),
                              ),
                              SfSliderTheme(
                                data: SfSliderThemeData(
                                  inactiveTickColor: Colors.white,
                                  activeTickColor: Colors.white,
                                  activeLabelStyle: sliderStyle(),
                                  inactiveLabelStyle: sliderStyle(),
                                ),
                                child: SfSlider(
                                  min: 0,
                                  max: 10,
                                  value: stressCounter,
                                  interval: 1,
                                  stepSize: 1,
                                  showTicks: true,
                                  showLabels: true,
                                  enableTooltip: true,
                                  activeColor: primaryColor,
                                  minorTicksPerInterval: 1,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      stressCounter = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "How many new places do you visit a year?",
                                style: style(15, false, primaryColor),
                              ),
                              SfSliderTheme(
                                data: SfSliderThemeData(
                                  inactiveTickColor: Colors.white,
                                  activeTickColor: Colors.white,
                                  activeLabelStyle: sliderStyle(),
                                  inactiveLabelStyle: sliderStyle(),
                                ),
                                child: SfSlider(
                                  min: 0,
                                  max: 10,
                                  value: placesCounter,
                                  interval: 1,
                                  stepSize: 1,
                                  showTicks: true,
                                  showLabels: true,
                                  enableTooltip: true,
                                  activeColor: primaryColor,
                                  minorTicksPerInterval: 1,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      placesCounter = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "How many people do you help achieve a better life?",
                                style: style(15, false, primaryColor),
                              ),
                              SfSliderTheme(
                                data: SfSliderThemeData(
                                  inactiveTickColor: Colors.white,
                                  activeTickColor: Colors.white,
                                  activeLabelStyle: sliderStyle(),
                                  inactiveLabelStyle: sliderStyle(),
                                ),
                                child: SfSlider(
                                  min: 0,
                                  max: 10,
                                  value: peopleCounter,
                                  interval: 1,
                                  stepSize: 1,
                                  showTicks: true,
                                  showLabels: true,
                                  enableTooltip: true,
                                  activeColor: primaryColor,
                                  minorTicksPerInterval: 1,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      peopleCounter = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "With how many people do you interract with during a typical day?",
                                style: style(15, false, primaryColor),
                              ),
                              SfSliderTheme(
                                data: SfSliderThemeData(
                                  inactiveTickColor: Colors.white,
                                  activeTickColor: Colors.white,
                                  activeLabelStyle: sliderStyle(),
                                  inactiveLabelStyle: sliderStyle(),
                                ),
                                child: SfSlider(
                                  min: 0,
                                  max: 10,
                                  value: interactCounter,
                                  interval: 1,
                                  stepSize: 1,
                                  showTicks: true,
                                  showLabels: true,
                                  enableTooltip: true,
                                  activeColor: primaryColor,
                                  minorTicksPerInterval: 1,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      interactCounter = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "How many remarkable acheievements are you proud of?",
                                style: style(15, false, primaryColor),
                              ),
                              SfSliderTheme(
                                data: SfSliderThemeData(
                                  inactiveTickColor: Colors.white,
                                  activeTickColor: Colors.white,
                                  activeLabelStyle: sliderStyle(),
                                  inactiveLabelStyle: sliderStyle(),
                                ),
                                child: SfSlider(
                                  min: 0,
                                  max: 10,
                                  value: achievementsCounter,
                                  interval: 1,
                                  stepSize: 1,
                                  showTicks: true,
                                  showLabels: true,
                                  enableTooltip: true,
                                  activeColor: primaryColor,
                                  minorTicksPerInterval: 1,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      achievementsCounter = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              pageChanger(),
                              SizedBox(
                                height: 50,
                              )
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              if (selectedPage == 1)
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Just a few more questions to the \nstart of a new healthy life !!",
                                textAlign: TextAlign.center,
                                style: style(18, false, primaryColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          //here
                          SizedBox(
                            height: 50,
                          ),
                          pageChanger(),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }

  Row pageChanger() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => setState(() {
            selectedPage -= 1;
          }),
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(color: selectedPage == 0 ? deactivatedPrimaryColor : primaryColor, borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 12,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Prev",
                    // style: selectedPage == 0 ? style(15, true, Colors.black) :
                  )
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            selectedPage += 1;
          }),
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(color: selectedPage == 1 ? deactivatedPrimaryColor : primaryColor, borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Next",
                    // style: selectedPage == 0 ? style(15, true, Colors.black) :
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  TextStyle sliderStyle() {
    return TextStyle(color: Colors.white, fontSize: 12, fontFamily: "Poppins");
  }

  Container textField(TextEditingController controller, String hintText, bool isPassword) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Color.fromRGBO(43, 43, 43, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              // width: 100,
              child: TextField(
                controller: controller,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  color: Colors.white,
                ),
                decoration: InputDecoration.collapsed(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12,
                    color: Color.fromRGBO(140, 140, 140, 1),
                  ),
                ),
              ),
            ),
            Spacer(),
            isPassword ? Image.asset("assets/images/passwordVisibility.png") : SizedBox(),
          ],
        ),
      ),
    );
  }

  TextStyle style(double size, bool isBold, Color color) {
    return TextStyle(
      fontFamily: "Poppins",
      color: color,
      fontSize: size,
      fontWeight: isBold ? FontWeight.bold : null,
    );
  }
}
