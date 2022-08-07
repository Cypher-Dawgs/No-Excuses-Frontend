import 'package:flutter/material.dart';
import 'package:no_excuses/palette.dart';
import 'package:no_excuses/providers/provider.dart';
import 'package:no_excuses/signup-screen/screens/signup_screen.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = "/edit-profile";

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = new TextEditingController();
  bool update = false;

  @override
  void initState() {
    nameController.text = Provider.of<Data>(context, listen: false).username;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  child: Image.asset("assets/images/back.png"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(360),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: primaryColor,
                          ),
                          child: Image.asset(
                            "assets/images/profile.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Provider.of<Data>(context, listen: false).username,
                        style: style(15, primaryColor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        Provider.of<Data>(context, listen: false).email,
                        style: style(10, Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Full Name",
                style: style(15, primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
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
                          enabled: update ? true : false,
                          keyboardType: TextInputType.number,
                          controller: nameController,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration.collapsed(
                            hintText: "",
                            hintStyle: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12,
                              color: Color.fromRGBO(140, 140, 140, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Work-balance score",
                style: style(15, primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(43, 43, 43, 1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color.fromRGBO(0, 0, 0, 1),
                    )),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Provider.of<Data>(context, listen: false).score,
                    style: style(
                      15,
                      Color.fromRGBO(185, 185, 185, 1),
                    ),
                  ),
                ),
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
                        update = !update;
                        Provider.of<Data>(context, listen: false).username = nameController.text;
                      });
                    },
                    child: Text(
                      "Update username",
                      style: style(
                        15,
                        update ? Colors.green : Color.fromRGBO(255, 0, 0, 1),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.popUntil(context, ModalRoute.withName(SignUp.routeName));
                      // Navigator.popAndPushNamed(context, SignUp.routeName);
                    },
                    child: Text(
                      "Logout ->",
                      style: style(
                        15,
                        Color.fromRGBO(255, 0, 0, 1),
                      ),
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
                  Container(
                    height: 120,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
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
