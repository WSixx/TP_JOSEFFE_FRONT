import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_final/constants/constants.dart';

Row kEditRow = Row(
  children: [
    Icon(
      FontAwesomeIcons.edit,
      size: 18.0,
      color: Colors.black,
    ),
    SizedBox(width: 10.0),
    kTextEditar,
  ],
);

styleStatusButton(bool statusCliente) {
  return TextStyle(
    color: statusCliente ? Colors.green : Colors.red,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );
}

BoxDecoration kBoxDeco = BoxDecoration(
  border: Border.all(
    color: Colors.black,
    width: 3,
  ),
  borderRadius: BorderRadius.circular(12),
);
