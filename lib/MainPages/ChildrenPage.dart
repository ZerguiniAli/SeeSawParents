import 'package:flutter/material.dart';
import 'package:untitled/MainPages/ChildPage.dart';
import 'package:untitled/utils/ChildrenCard.dart';
import '../DB/mysqlConnection.dart';

class ChildrenPage extends StatefulWidget {
  final String id;
  const ChildrenPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {
  String? Id;
  List<List<dynamic>> Data = [];

  @override
  void initState() {
    super.initState();
    Id = widget.id;
    fetchData(); // Call fetchData
  }

  Future<void> fetchData() async {
    try {
      var mysql = Mysql();
      await mysql.connect();

      var results = await mysql.connection.query(
          'SELECT e.eleve_id, e.Nom, e.Prenom, e.date_de_naissance , e.lieu_de_naissance , et.nom AS establishment_name FROM eleve e JOIN classe c ON e.classe_id = c.classe_id JOIN etablissement et ON c.etablissement_id = et.etablissement_id WHERE e.pere_id = ?;',
          [Id]);
      if (results.isNotEmpty) {
        setState(() {
          Data = results.map((row) {
            return [
              row['eleve_id'].toString(),
              row['Nom'].toString(),
              row['Prenom'].toString(),
              row['date_de_naissance'].toString(),
              row['lieu_de_naissance'].toString(),
              row['establishment_name'].toString(),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.01),
          child: Navigator(
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/':
                  return MaterialPageRoute(
                    builder: (context) => Container(
                      child: ListView.separated(
                        itemCount: Data.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10), // Add space between items
                        itemBuilder: (context, index) {
                          // Return the widget representing each item
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/subclass',
                                  arguments: Data[index][0]);
                            },
                            child: ChildrenCard(
                              id_student: Data[index][0],
                              lName: Data[index][1],
                              fName: Data[index][2],
                              etb_Name: Data[index][3],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                case '/subclass':
                  final eleve_id = settings.arguments as String;
                  final index = Data.indexWhere((element) => element[0] == eleve_id);
                  return MaterialPageRoute(
                    builder: (context) => ChildPage(
                      eleve_id: Data[index][0],
                      fName: Data[index][1],
                      lName: Data[index][2],
                      BirthDate: Data[index][3],
                      BirthPlace: Data[index][4],
                      etb: Data[index][5],
                    ),
                  );
                default:
                  return MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: Center(
                        child: Text('Page not found'),
                      ),
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
