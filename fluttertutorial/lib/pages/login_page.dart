import 'package:flutter/material.dart';
import 'package:fluttertutorial/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                'Welcome to $name',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
                child: Text('testing1'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter Mobile No.',
                          labelText: 'Mobile No.'),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Mobile No. is Required !!!';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Enter Password', labelText: 'Password'),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Password is Required !!!';
                          } else if (value.length < 6) {
                            return 'Password Length should be 6 character !!!';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 50,
                          width: changeButton ? 50 : 150,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            // shape: changeButton
                            //     ? BoxShape.circle
                            //     : BoxShape.rectangle,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
