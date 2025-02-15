import 'package:bmi_calculator/colors.dart';
import 'package:flutter/material.dart';

import 'calcutaling.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:colorsApp.mainColor,

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 39 , vertical: 50),
        padding: EdgeInsets.all(30),

        child: Column(
          children: [
            Image.asset("images/assets/homePic.png",
              width: 300,
              height: 300,
            ),
            SizedBox(
              height: 90,
            ),
            Text(textAlign: TextAlign.start,
              "Get Starting with Tracking Your Health!" ,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xFFFFFFFF),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Calculate your BMI and stay on top of your wellness journey , effortlessly",
              style: TextStyle(
                color: Color(0xFFC6C3F9),
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 70,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorsApp.button,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 22,
                  ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                  //    side: BorderSide(color: Colors.blue, width: 2), // Border
                    )
                ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(BuildContext context ) => CalculatingScreen()));
                  },
                  child: Text("Get Started ",
              style: TextStyle(
                  fontSize: 20,
              ),)),
            )
          ],
        ),
      ),

    );
  }
}
