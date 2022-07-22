import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:learnflutter1/change_name_card.dart';
import 'package:learnflutter1/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:learnflutter1/utils/Constants.dart';

class HomePageFB extends StatefulWidget {
  @override
  State<HomePageFB> createState() => _HomePageFBState();
}

class _HomePageFBState extends State<HomePageFB> {
  TextEditingController _nameController = TextEditingController();
  var myText = 'Change Me';
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future getData() async {
    var res = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    data = jsonDecode(res.body);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text('My App Bar'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Constants.prefs.setBool('loggedIn', false);
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: data != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      title: Text(data[index]['title']),
                      subtitle: Text('ID: ${data[index]['id']}'),
                      leading: Image.network(data[index]['url']),
                    ),
                  );
                },
                itemCount: data.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
