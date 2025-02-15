import 'package:flutter/cupertino.dart';
import 'package:bmi_calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/calcutaling.dart';


class weightContainer extends StatefulWidget {

  const weightContainer({super.key,});

  @override
  State<weightContainer> createState() => _weightContainerState();
}

class _weightContainerState extends State<weightContainer> {
  int weight = 70;
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
          Text("Weight" ,
            style: TextStyle(
                color: colorsApp.text,
                fontSize: 20
            ),
          ),
          Text("$weight",
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
                  if(weight>1 ){
                    setState((){
                      weight--;
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
                  if(weight>1 ){
                    setState((){
                      weight++;
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
