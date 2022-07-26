import 'package:flutter/material.dart';
import 'package:fluttertutorial/pages/home_page.dart';
import 'package:fluttertutorial/pages/login_page.dart';
import 'package:fluttertutorial/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyFlutters());
}

class MyFlutters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(brightness: Brightness.light),
      initialRoute: '/home',
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}
