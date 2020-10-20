import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget alertTextField(TextEditingController controle, String label,
    List<TextInputFormatter> inpuType, IconData icone) {
  return TextField(
    key: UniqueKey(),
    inputFormatters: inpuType,
    //keyboardType: TextInputType.datetime,
    controller: controle,
    decoration: InputDecoration(
      icon: Icon(icone),
      labelText: label,
    ),
  );
}
