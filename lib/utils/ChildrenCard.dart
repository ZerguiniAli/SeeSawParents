import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChildrenCard extends StatelessWidget {
  final String id_student;
  final String fName;
  final String lName;
  final String etb_Name;
  const ChildrenCard({super.key, required this.id_student, required this.fName, required this.lName, required this.etb_Name});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.06),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green, Colors.lightGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
        color: Colors.green,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$lName $fName", style: TextStyle(
                color: Colors.white,
                fontSize: screenHeight*0.02,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: screenHeight*0.015,),
              Text("$etb_Name", style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight*0.02,
                  fontWeight: FontWeight.bold
              ),)
            ],
          ),
          Container(
            height: screenHeight*0.06,
            child: Image.asset('lib/icons/students.png'),
          )
        ],
      ),
    );
  }
}
