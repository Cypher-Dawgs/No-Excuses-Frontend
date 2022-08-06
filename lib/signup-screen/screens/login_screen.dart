import 'package:flutter/material.dart';
import 'package:no_excuses/palette.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Login", style: style(18, false, primaryColor))],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo_full.png"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              // color: Colors.blue,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "E-mail",
                        style: style(15, false, primaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textField(emailController, "Enter your e-mail", false),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Password",
                        style: style(15, false, primaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textField(passwordController, "Enter your password", true),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(primaryColor),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                          elevation: MaterialStateProperty.all(0),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "or continue with",
                        style: style(12, false, Color.fromRGBO(165, 165, 165, 1)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      thirdPartySignInButton("google.png", "Google"),
                      thirdPartySignInButton("facebook.png", "Facebook"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "dont have an account? ",
                            style: style(12, false, Color.fromRGBO(165, 165, 165, 1)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Login.",
                              style: style(12, false, primaryColor),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container thirdPartySignInButton(String img, String name) {
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(43, 43, 43, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: 20,
              child: Image.asset(
                "assets/images/$img",
                fit: BoxFit.cover,
              )),
          Text(
            name,
            style: style(15, false, Colors.white),
          )
        ],
      ),
    );
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
