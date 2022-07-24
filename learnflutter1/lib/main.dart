import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:learnflutter1/bg_image.dart';
import 'package:learnflutter1/drawer.dart';
import 'package:learnflutter1/pages/home_page.dart';
import 'package:learnflutter1/pages/home_page_with_fb.dart';
import 'package:learnflutter1/pages/home_page_with_sb.dart';
import 'package:learnflutter1/pages/login_page.dart';
import 'package:learnflutter1/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Testing App',
    home: Constants.prefs.getBool('loggedIn') == true
        ? HomePageSB()
        : LoginPage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    routes: {
      '/login': (context) => LoginPage(),
      '/home': (context) => HomePageSB()
    },
  ));
}
