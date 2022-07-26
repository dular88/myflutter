import 'package:flutter/material.dart';
import 'package:fluttertutorial/utils/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'login.png',
              fit: BoxFit.cover,
              height: 300,
            ),
            SizedBox(
              height: 20.0,
              child: Text('testing'),
            ),
            Text(
              'Welcome to Login',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
              child: Text('testing1'),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter Mobile No.', labelText: 'Mobile No.'),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Enter Password', labelText: 'Password'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: Text('Login'),
                    style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}