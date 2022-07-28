import 'dart:html';

import 'package:flutter/material.dart';

import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  @override
  final int age = 34;
  final String name = 'Dinesh';
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog App'),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: dummyList.length,
              itemBuilder: (context, index) {
                return ItemWidget(item: dummyList[index]);
              })),
      drawer: MyDrawer(),
    );
  }
}
