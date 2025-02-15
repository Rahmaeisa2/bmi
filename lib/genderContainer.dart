import 'package:bmi_calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class genderContainer extends StatelessWidget {
  final String icon;
  final String title;
  final bool isActive;
  final void Function()? onTap;
  const genderContainer({super.key, required this.icon, required this.title, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:InkWell(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),

              height: 180,
              decoration: BoxDecoration(


                  borderRadius: BorderRadius.circular(12),
                  color: isActive?Colors.blueGrey : colorsApp.main
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  SvgPicture.asset(icon,
                  theme: SvgTheme(
                    currentColor: colorsApp.mainColor,
                  ),),
              SizedBox(height: 10,
              ),
              Text(title,style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: colorsApp.text,
              ),)
          ])

        )
        )
    );
  }
}
