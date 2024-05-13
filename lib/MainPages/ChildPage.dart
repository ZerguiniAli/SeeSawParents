import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/absentCard.dart';

import '../DB/mysqlConnection.dart';
import '../utils/StudentCard.dart';

class ChildPage extends StatefulWidget {
  final String eleve_id;
  final String fName;
  final String lName;
  final String BirthDate;
  final String BirthPlace;
  final String etb;
  const ChildPage({super.key, required this.eleve_id, required this.fName, required this.lName, required this.BirthDate, required this.BirthPlace, required this.etb});


  @override
  State<ChildPage> createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  List<List<dynamic>> Data = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Call fetchData
  }

  Future<void> fetchData() async {
    try {
      var mysql = Mysql();
      await mysql.connect();

      var results = await mysql.connection.query(
          'SELECT * FROM absense WHERE eleve_id = ?',
          [widget.eleve_id]);
      if (results.isNotEmpty) {
        setState(() {
          Data = results.map((row) {
            return [
              row['absense_id'].toString(),
              row['date_absense'].toString(),
              row['temp_absense'].toString(),
              row['justified'].toString(),
            ];
          }).toList();
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: screenHeight*0.05),
        child: Column(
          children: [
            StudentCard(id: widget.eleve_id, fName: widget.fName, lName: widget.lName, birthdate: widget.BirthDate, birthplace: widget.BirthPlace, etb: widget.etb,),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: Data.length,
                  itemBuilder: (context, index){
                    return AbsentCard(
                      id: Data[index][0],
                      date_absence: Data[index][1],
                      session: Data[index][2],
                      justified: Data[index][3],
                    );
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
