import 'package:flutter/material.dart';
import 'package:no_excuses/edit_profile_screen/edit_profile_screen.dart';
import 'package:no_excuses/palette.dart';
import 'package:no_excuses/providers/provider.dart';
import 'package:no_excuses/signup-screen/screens/signup_screen.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(360),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(360),
                      color: primaryColor,
                    ),
                    child: Image.asset(
                      "assets/images/profile.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Provider.of<Data>(context, listen: false).username,
                      style: style(15, primaryColor),
                    ),
                    Text(
                      Provider.of<Data>(context, listen: false).email,
                      style: style(8, Colors.white),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(EditProfileScreen.routeName);
              },
              child: Text(
                "Edit profile",
                style: style(15, Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Update work-life balance score",
              style: style(15, Colors.white),
            ),
            SizedBox(
              height: 30,
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
                  Color.fromRGBO(255, 77, 77, 1),
                ),
              ),
            )
          ],
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
