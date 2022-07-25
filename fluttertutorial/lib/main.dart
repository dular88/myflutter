import 'package:flutter/material.dart';
import 'package:fluttertutorial/pages/home_page.dart';
import 'package:fluttertutorial/pages/login_page.dart';

void main() {
  runApp(MyFlutters());
}

class MyFlutters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.light),
      initialRoute: '/home',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage()
      },
    );
  }
}
