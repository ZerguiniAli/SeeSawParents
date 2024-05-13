import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Page/Home.dart';
import 'Page/Login.dart';
import 'Page/Start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  SharedPreferences id = await SharedPreferences.getInstance();
  int value_prefs = prefs.getInt('start_value') ?? 1;
  String value_id = id.getString('id_user') ?? "";

  Widget initialWidget;
  switch (value_prefs) {
    case 1:
      initialWidget = Start();
      break;
    case 2:
      initialWidget = Login();
      break;
    case 3:
      initialWidget = Home(Id:value_id);
      break;
    default:
      initialWidget = Start(); // Default to Start if value is not recognized
      break;
  }

  runApp(MyApp(initialWidget: initialWidget));
}

class MyApp extends StatelessWidget {
  final Widget initialWidget;

  const MyApp({Key? key, required this.initialWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: initialWidget,
      color: Colors.white,
    );
  }
}
