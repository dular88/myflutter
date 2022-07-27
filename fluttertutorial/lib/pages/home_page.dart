import 'dart:html';

import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  final int age = 34;
  final String name = 'Dinesh';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog App'),
      ),
      body: Center(
        child: Container(
          child: Text('Testing Catalog App'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
