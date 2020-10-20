import 'package:flutter/material.dart';

class FormFieldAdd extends StatelessWidget {
  //String title; // TextInputType inputType, TextEditingController controller
  final title;
  final inputType;
  final controller;

  const FormFieldAdd({Key key, this.title, this.inputType, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        /*validator: (val) {
          if (val.length == 0) {
            return "Email cannot be empty";
          } else {
            return null;
          }
        },*/
        keyboardType: inputType,
        style: new TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}
