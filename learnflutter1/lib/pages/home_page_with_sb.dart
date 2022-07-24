import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:learnflutter1/change_name_card.dart';
import 'package:learnflutter1/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:learnflutter1/utils/Constants.dart';

class HomePageSB extends StatelessWidget {
  Future getData() async {
    var url = "https://jsonplaceholder.typicode.com/photos";
    var res = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(res.body);

    return data;
    // setState(() {});
  }

  Stream<List<String>> getStreamData() {
    var data = Stream<List<String>>.fromIterable(
        [List<String>.generate(20, (index) => 'Item $index'.toString())]);
    return data;
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
      body: StreamBuilder(
          stream: getStreamData(),
          builder: (context, snapshot) {
              if (snapshot.hasData) {
      var myList = snapshot.data! as List<int>; // <-- Your data using 'as'
    }
            // switch (snapshot.connectionState) {
            //   case ConnectionState.none:
            //     return Center(
            //       child: Text('Fetch Something'),
            //     );
            //   case ConnectionState.active:
            //   case ConnectionState.waiting:
            //     return Center(child: CircularProgressIndicator());
            //   case ConnectionState.done:
            //     if (snapshot.hasError) {
            //       return Center(child: Text('Some Error Occured'));
            //     }

                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data.['index']),
                    );
                  },
                  itemCount: 1,
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
