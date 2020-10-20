import 'package:flutter/material.dart';

class ScreenButton extends StatelessWidget {
  final Color color;
  final String textScreen;
  final String screenNav;

  const ScreenButton(
      {Key key,
      @required this.color,
      @required this.textScreen,
      @required this.screenNav})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: color,
        child: Container(
          height: 150.0,
          width: 250.0,
          child: Center(
            child: Text(
              textScreen,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, screenNav);
        });
  }
}
