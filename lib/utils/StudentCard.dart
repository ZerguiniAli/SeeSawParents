import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  final String fName;
  final String lName;
  final String birthdate;
  final String birthplace;
  final String etb;
  final String id;
  const StudentCard({super.key, required this.id, required this.fName, required this.lName, required this.birthdate, required this.birthplace, required this.etb});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight*0.02),
      padding: EdgeInsets.symmetric(vertical: screenHeight*0.02, horizontal: screenWidth*0.05),
      height: screenHeight*0.2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.green, Colors.lightGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(screenHeight*0.015),
                alignment: Alignment.center,
                height: screenHeight*0.12,
                width: screenHeight*0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset("lib/icons/students.png"),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("$fName $lName", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight*0.02,
                  ),),
                  Text("$etb", style: TextStyle(
                    fontSize: screenHeight*0.015,
                  ),),
                  Text("$birthdate", style: TextStyle(
                    fontSize: screenHeight*0.015,
                  ),),
                  Text("$birthplace", style: TextStyle(
                    fontSize: screenHeight*0.015,
                  ),),
                ],
              )
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(id, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenHeight*0.03,
              ),),
            ),
          )
        ],
      ),
    );
  }
}
