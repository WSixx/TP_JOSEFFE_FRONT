import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget snackBAr(
    BuildContext context, String title, String message, Color color) {
  return Flushbar(
    title: title,
    message: message,
    duration: Duration(seconds: 3),
    backgroundGradient: LinearGradient(colors: [color, Colors.teal]),
    backgroundColor: Colors.red,
    boxShadows: [
      BoxShadow(
        color: Colors.blue[800],
        offset: Offset(0.0, 2.0),
        blurRadius: 3.0,
      )
    ],
  )..show(context);
}
