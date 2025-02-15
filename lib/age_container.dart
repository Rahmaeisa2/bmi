import 'package:flutter/cupertino.dart';
import 'package:bmi_calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/calcutaling.dart';


class ageContainer extends StatefulWidget {

  const ageContainer({super.key});

  @override
  State<ageContainer> createState() => _ageContainerState();
}

class _ageContainerState extends State<ageContainer> {
  int age = 30 ;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),


        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Age" ,
              style: TextStyle(
                  color: colorsApp.text,
                  fontSize: 20
              ),
            ),
            Text("$age",
              style: TextStyle(
                fontSize: 60 ,
                color: colorsApp.mainColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: FloatingActionButton.small(onPressed: () {
                    if(age>1 ){
                      setState((){
                        age--;
                      });
                    };
                  },
                    shape: CircleBorder(),
                    backgroundColor: colorsApp.textColor,
                    child: Icon(Icons.remove ,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ) ,
                Flexible(
                  child: FloatingActionButton.small(onPressed: () {
                    if(age>1 ){
                      setState((){
                        age++;
                      });
                    };
                  },
                    shape: CircleBorder(),
                    backgroundColor: colorsApp.textColor,
                    child: Icon(Icons.add ,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                )
              ],
            )
          ],

        ),

    );
  }
}
