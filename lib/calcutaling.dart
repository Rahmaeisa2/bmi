import 'dart:math';

import 'package:bmi_calculator/age_container.dart';
import 'package:bmi_calculator/result.dart';
import 'package:bmi_calculator/weight_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/colors.dart';
import 'package:flutter/widgets.dart';


class CalculatingScreen extends StatefulWidget {
  const CalculatingScreen({super.key});

  @override
  State<CalculatingScreen> createState() => _CalculatingScreenState();
}

class _CalculatingScreenState extends State<CalculatingScreen> {
  double sliderValue = 160;
  int age = 30 ;
  int weight = 70;
  bool? isMale;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMale = null;
        });
      },
      child: Scaffold(
          backgroundColor: Color(0xFFF4F3FF),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 50,
              ),
              child: Center(
                child: Text(
                  "BMI CALCULATOR",
                  style: TextStyle(
                    fontSize: 20,
                    color: colorsApp.textColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12
              ),

                child: Row(
                  children: [
                   Expanded(child: ageContainer()),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(child: weightContainer()),
                  ],
                ),
              ),
            SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFFFFFFFF),

                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Height (CM)" ,
                          style: TextStyle(
                            color: colorsApp.textColor,
                            fontSize: 23,
                        ),),

                        Text("${sliderValue.toInt()}" ,
                        style: TextStyle(
                          fontSize: 50,
                          color: colorsApp.mainColor,
                        ),),
                        SliderTheme(data: SliderTheme.of(context).copyWith(
                          trackHeight: 5,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),

                        ), child: Slider(
                            value: sliderValue, onChanged: (value){
                             setState((){
                             sliderValue = value;
                               });
                                     },
                         min: 50,
                         max: 200,
                       activeColor: colorsApp.mainColor,

      ),
                        ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 20
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("50 cm", style: TextStyle(fontSize: 16)),
                          Text("300 cm", style: TextStyle(fontSize: 16)),
                        ],),
                    )
                      ],
                    ),
                  ),


                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox
              (
              width: 270,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: (isMale == true) ? Colors.black: Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.male, size: 50, color: colorsApp.mainColor),
                            Text("Male", style: TextStyle(fontSize: 18, color: colorsApp.mainColor)),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: (isMale == false) ? Colors.black : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.female, size: 50, color: colorsApp.mainColor),
                            Text("Female", style: TextStyle(fontSize: 18, color: colorsApp.mainColor)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),



            SizedBox(height: 30,),
             SizedBox(

               height: 70,
               width: 300,
               child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorsApp.mainColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 22,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        //side: BorderSide(color: Colors.blue, width: 2), // Border
                      )
                  ),
                  onPressed: (){
                    if(isMale != null){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ResultScreen(
                        height: sliderValue,
                        weight: weight,
                        age: age,
                        isMale: isMale??true,)));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select your gender")));
                    }

                  },
                  child: Text("Get Started ",
                    style: TextStyle(
                      color: colorsApp.textColor,
                      fontSize: 20,
                    ),)),
             ),





              ],

        )
        ),
    );

  }
}
