import 'package:flutter/material.dart';

void main() {
  runApp(MyFlutters());
}

class MyFlutters extends StatelessWidget {
  const MyFlutters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(
            child: Text('Welcome Flutter'),
          ),
        ),
      ),
    );
  }
}
