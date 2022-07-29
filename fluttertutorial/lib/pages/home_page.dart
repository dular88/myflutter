import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final int age = 34;

  final String name = 'Dinesh';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString('files/catalog.json');
    final decodedData = jsonDecode(catalogJson);
    var photosData = decodedData['photos'];
    CatalogModel.items =
        List.from(photosData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog App'),
      ),
      body: Center(
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    final item = CatalogModel.items[index];
                    return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GridTile(
                            header: Container(
                              child: Text(
                                item.title,
                                style: TextStyle(color: Colors.white),
                              ),
                              padding: const EdgeInsets.all(12),
                              decoration:
                                  BoxDecoration(color: Colors.deepPurple),
                            ),
                            child: Image.network(item.thumbnailUrl),
                            footer: Container(
                              child: Text(
                                item.id.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              padding: const EdgeInsets.all(12),
                              decoration:
                                  BoxDecoration(color: Colors.deepPurple),
                            )));
                  },
                  itemCount: CatalogModel.items.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: MyDrawer(),
    );
  }
}
