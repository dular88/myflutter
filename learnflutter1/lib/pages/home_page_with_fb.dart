import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:learnflutter1/change_name_card.dart';
import 'package:learnflutter1/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:learnflutter1/utils/Constants.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return data;
    // setState(() {});
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
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('Fetch Something'),
                );
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(child: Text('Some Error Occured'));
                }

                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index]['title']),
                      subtitle: Text('ID ${data[index]['id']}'),
                      leading: Image.network(data[index]['url']),
                    );
                  },
                  itemCount: data.length,
                );
            }
          }),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  myText = _nameController.text;
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
