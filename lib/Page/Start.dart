import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
          child: Container(
            height: screenHeight * 0.7,
            width: screenWidth*0.9,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Image.asset("lib/icons/StartPage.png"),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Center(
                      child: Text("Welcome to\nSeeSaw",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight*0.045,
                            color: Colors.green
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Center(
                      child: Text("Streamlines the attendance process,\n saving teachers time and providing\n parents with real-time information\n about their childs school day.",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: screenHeight*0.018,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(
                      onPressed: () async {
                        // Update shared preferences value
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setInt('start_value', 2);

                        // Navigate to the next page
                        Navigator.pushReplacement(context,
                             MaterialPageRoute(builder:(context) => Login())
                        );
                      },
                      color: Colors.green,
                      minWidth: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("Start", style: TextStyle(color: Colors.white, fontSize: screenHeight*0.025),),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
