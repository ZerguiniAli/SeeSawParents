import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AbsentCard extends StatelessWidget {
  final String id;
  final String date_absence;
  final String session;
  final String justified;
  const AbsentCard({super.key, required this.id, required this.date_absence, required this.session, required this.justified});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String Justified = justified;
    if(Justified == "0"){
      Justified = "NON";
    }else{
      Justified = "YES";
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: screenHeight*0.02, horizontal: screenWidth*0.05),
      margin: EdgeInsets.only(bottom: screenHeight*0.015),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey, width: screenWidth*0.003),
        color: Justified == "NON" ? Colors.red[300] : Colors.green[300],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Absense Date", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Text(date_absence),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Session", style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
                Text(session),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Justified", style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
                Text(Justified),
              ],
            ),
          )
        ],
      ),
    );
  }
}
