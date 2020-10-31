import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          child: RaisedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/homePage');
            },
          ),
        ),
      ),
    );
  }
}
