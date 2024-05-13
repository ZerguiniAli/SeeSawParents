import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:seesaw1/MainPages/Class.dart';
//import 'package:seesaw1/MainPages/ProfilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/MainPages/ChildrenPage.dart';
import 'package:untitled/MainPages/HomePage.dart';
import 'package:untitled/MainPages/ProfilePage.dart';
import '../DB/mysqlConnection.dart';
//import '../MainPages/HomePage.dart';

class Home extends StatefulWidget {
  final String Id;
  const Home({Key? key, required this.Id}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<List<dynamic>> Data = [], Absence =[];
  final PageController _pageController = PageController();
  late String id, etablishment_name = "", NumberOfClasses = "", NumberOfStudents = "";

  @override
  void initState() {
    super.initState();
    id = widget.Id;
    fetchData(); // Call fetchData
  }

  Future<void> fetchData() async {
    try {
      var mysql = Mysql();
      await mysql.connect();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('id_user', id);

      var results = await mysql.connection.query('SELECT * FROM pere WHERE pere_id = ?', [id]);
      if (results.isNotEmpty) {
        setState(() {
          Data = results.map((row) {
            return [
              row['pere_id'].toString(),
              row['Nom'].toString(),
              row['Prenom'].toString(),
              row['date_de_naissance'].toString(),
              row['lieu_de_naissance'].toString(),
              row['num_de_telephone'].toString(),
              row['email'].toString(),
            ];
          }).toList();
        });
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }



  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // If Data is empty, show a loading indicator or a placeholder widget
    if (Data.isEmpty) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
             color: Colors.grey,
          ), // Or any loading indicator widget
        ),
      );
    }

    // If Data is not empty, continue building the UI
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          HomePage(fName: Data[0][1],lname: Data[0][2],),
          ChildrenPage(id: id,),
          ProfilePage(Nom: Data[0][1], Prenom: Data[0][2], date_de_naissance: Data[0][3], Lieu_de_naissance: Data[0][4], NumTelephone: Data[0][5], email: Data[0][6],)
        ],
      ),
      bottomNavigationBar: Container(
        height: screenHeight * 0.06,
        margin: EdgeInsets.only(
            bottom: screenHeight * 0.02,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: screenHeight*0.01, horizontal: screenWidth*0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                      _pageController.jumpToPage(0);
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(vertical: screenHeight*0.006, horizontal: screenWidth*0.08),
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0 ? Colors.white : null,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      "lib/icons/homepage.png",
                      color: _selectedIndex == 0 ? Colors.green : Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                      _pageController.jumpToPage(1);
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(vertical: screenHeight*0.006, horizontal: screenWidth*0.08),
                    decoration: BoxDecoration(
                      color: _selectedIndex == 1 ? Colors.white : null,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      "lib/icons/sister.png",
                      color: _selectedIndex == 1 ? Colors.green: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                      _pageController.jumpToPage(2);
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(vertical: screenHeight*0.006, horizontal: screenWidth*0.08),
                    decoration: BoxDecoration(
                      color: _selectedIndex == 2 ? Colors.white : null,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      "lib/icons/avatar.png",
                      color: _selectedIndex == 2 ? Colors.green : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
