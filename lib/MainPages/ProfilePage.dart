import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Page/Login.dart';

class ProfilePage extends StatelessWidget {
  final String Nom;
  final String Prenom;
  final String date_de_naissance;
  final String Lieu_de_naissance;
  final String email;
  final String NumTelephone;
  const ProfilePage({super.key, required this.Nom, required this.Prenom, required this.date_de_naissance,  required this.Lieu_de_naissance, required this.email, required this.NumTelephone});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: screenWidth*0.04, right: screenWidth*0.04, top: screenHeight*0.07, bottom: screenHeight*0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(screenHeight*0.015),
              alignment: Alignment.center,
              height: screenHeight*0.15,
              width: screenHeight*0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset("lib/icons/man.png"),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: screenHeight*0.022, horizontal: screenWidth*0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    blurRadius: 30,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Last Name(familly name) :", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight*0.014
                  ),),
                  Text("${Nom}", style: TextStyle(
                      fontSize: screenHeight*0.0145,
                      fontWeight: FontWeight.w400
                  ),),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: screenHeight*0.022, horizontal: screenWidth*0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    blurRadius: 30,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("First Name :", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight*0.014
                  ),),
                  Text("${Prenom}", style: TextStyle(
                      fontSize: screenHeight*0.0145,
                      fontWeight: FontWeight.w400
                  ),),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: screenHeight*0.022, horizontal: screenWidth*0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    blurRadius: 30,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Birth Date :", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight*0.014
                  ),),
                  Text("${date_de_naissance}", style: TextStyle(
                      fontSize: screenHeight*0.0145,
                      fontWeight: FontWeight.w400
                  ),),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: screenHeight*0.022, horizontal: screenWidth*0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    blurRadius: 30,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Birth Place :", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight*0.014
                  ),),
                  Text("${Lieu_de_naissance}", style: TextStyle(
                      fontSize: screenHeight*0.0145,
                      fontWeight: FontWeight.w400
                  ),),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: screenHeight*0.022, horizontal: screenWidth*0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    blurRadius: 30,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Email :", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight*0.014
                  ),),
                  Text("$email", style: TextStyle(
                      fontSize: screenHeight*0.0145,
                      fontWeight: FontWeight.w400
                  ),),
                ],
              ),

            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: screenHeight*0.022, horizontal: screenWidth*0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    blurRadius: 30,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phone Number :", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight*0.014
                  ),),
                  Text("$NumTelephone", style: TextStyle(
                      fontSize: screenHeight*0.0145,
                      fontWeight: FontWeight.w400
                  ),),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 15),
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setInt('start_value', 2);
                  await prefs.setString('id_user', "");

                  // Navigate to the home page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                color: Colors.red,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Text("Log out", style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight*0.02,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
