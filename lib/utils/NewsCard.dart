import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String fName;
  final String lName;
  final String NombreAbsence;

  const NewsCard({Key? key, required this.fName, required this.lName, required this.NombreAbsence});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Parsing NombreAbsence to double
    double parsedAbsence = double.tryParse(NombreAbsence) ?? 0;

    List<Color> gradientColors = [];

    // Set gradient colors based on the value of parsedAbsence
    if (parsedAbsence > 5) {
      gradientColors = [Colors.red, Colors.orange];
    } else if (parsedAbsence == 0) {
      gradientColors = [Colors.green, Colors.lightGreen];
    } else {
      gradientColors = [Colors.orange, Colors.yellow];
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.06),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$fName $lName", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * 0.025,
                  color: Colors.white
              ),),
              Container(
                height: screenHeight * 0.06,
                child: Image.asset("lib/icons/students.png"),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.02),
            child: Text("$NombreAbsence session Absence", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenHeight * 0.03,
                color: Colors.white
            ),),
          )
        ],
      ),
    );
  }
}
