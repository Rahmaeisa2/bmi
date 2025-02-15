import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/colors.dart';

class ResultScreen extends StatefulWidget {
  final int weight;
  final double height;
  final bool isMale;
  final int age;

  const ResultScreen({
    super.key,
    required this.weight,
    required this.height,
    required this.isMale,
    required this.age,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  double convertHeightToMeter() {
    return widget.height / 100;
  }

  double calculateBMI() {
    return widget.weight / pow(convertHeightToMeter(), 2); // لحساب BMI
  }

  String getBMIStatus(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Normal";
    } else if (bmi >= 25 && bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }
  String getBMISuggestion(double bmi) {
    if (bmi < 18.5) return "You should eat more nutritious food!";
    if (bmi < 24.9) return "Great! Keep maintaining your healthy lifestyle!";
    if (bmi < 29.9) return "Consider regular exercise and a balanced diet.";
    return "Consult a doctor for a healthier weight plan.";
  }

  @override
  Widget build(BuildContext context) {
    double bmi = calculateBMI();
    String bmiStatus = getBMIStatus(bmi);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F3FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F3FF),
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 20,
            color: colorsApp.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 23),
        child: Column(
          children: [
            const Text(
              "Your Result",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              //  boxShadow: [
             //     BoxShadow(
              //      color: Colors.black.withOpacity(0.1),
                //    blurRadius: 6,
                 //   offset: const Offset(2, 4),
                //  ),
              //  ],
              ),
              child: Column(
                children: [
                  Text(
                    bmiStatus,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: colorsApp.textColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    bmi.toStringAsFixed(2), // تنسيق الرقم إلى رقمين عشريين
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: colorsApp.mainColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "You have a ${bmiStatus.toLowerCase()} body weight",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: colorsApp.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Gender: ${widget.isMale ? "Male" : "Female"}",
                    style: TextStyle(fontSize: 18, color: colorsApp.textColor,
                    fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Age: ${widget.age}",
                    style: TextStyle(fontSize: 18, color: colorsApp.textColor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    getBMISuggestion(calculateBMI()),
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: colorsApp.textColor,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorsApp.mainColor,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 21),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: Text(
                "Recalculate",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
