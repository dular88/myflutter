import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:learnflutter1/change_name_card.dart';
import 'package:learnflutter1/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:learnflutter1/utils/Constants.dart';

class HomePageFB extends StatelessWidget {
  Future getData() async {
    var url = "https://jsonplaceholder.typicode.com/photos";
    var res = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(res.body);

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
                print(snapshot.data);

                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data.toString()),
                      // subtitle: Text('ID ${snapshot[index].data['id']}'),
                      // leading: Image.network(snapshot.data[index]['url']),
                    );
                  },
                  itemCount: 3,
                );
            }
          }),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  myText = _nameController.text;
          //setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
