import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/utils/NewsCard.dart';

import '../DB/mysqlConnection.dart';

class HomePage extends StatefulWidget {
  final String fName;
  final String lname;
  const HomePage({Key? key, required this.fName, required this.lname}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<List<dynamic>> Data = [];
  String Id = "";

  @override
  void initState() {
    super.initState();
    fetchData(); // Call fetchData
  }

  Future<void> fetchData() async {
    try {
      var mysql = Mysql();
      await mysql.connect();

      SharedPreferences id = await SharedPreferences.getInstance();
      Id = id.getString('id_user') ?? "";
      print(Id);

      var results = await mysql.connection.query('SELECT e.Nom, e.Prenom, COUNT(a.absense_id) AS total_absences FROM eleve e LEFT JOIN absense a ON e.eleve_id = a.eleve_id WHERE e.pere_id = ? AND a.justified = 0 GROUP BY e.eleve_id ORDER BY `total_absences` DESC', [Id]);
      if (results.isNotEmpty) {
        setState(() {
          Data = results.map((row) {
            return [
              row['Nom'].toString(),
              row['Prenom'].toString(),
              row['total_absences'].toString(),
            ];
          }).toList();
        });
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String currentDate = "${DateTime.now().month}/${DateTime.now().day}/${DateTime.now().year}";

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: screenWidth*0.04, right: screenWidth*0.04, top: screenHeight*0.07, bottom: screenHeight*0.01),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: screenHeight*0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hi ${widget.lname} ${widget.fName}", style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight*0.02,
                          color: Colors.green
                      ),),
                      SizedBox(height: screenHeight*0.01,),
                      Text(currentDate, style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: screenHeight*0.02,
                      ),),
                    ],
                  ),
                  Container(
                    height: screenHeight*0.08,
                    child: Image.asset("lib/icons/man.png"),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("News", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenHeight*0.02
              ),),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: Data.length,
                  itemBuilder: (context, index){
                    return NewsCard(lName: Data[index][0],fName: Data[index][1],NombreAbsence: Data[index][2],);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
