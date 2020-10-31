import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_final/theme/theme.dart';

class MyAppBar extends PreferredSize {
  final Function toggle;
  final bool isOn;

  ThemeNotifier themeNotifier = ThemeNotifier();

  MyAppBar({this.toggle, this.isOn});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Text("Inicio"),
        flexibleSpace: Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xffB1097C),
                Color(0xff0947B1),
              ]),
        )),
        actions: [
          Consumer<ThemeNotifier>(
            builder: (context, notifier, child) => GestureDetector(
              child: Icon(
                Icons.lightbulb,
                color: notifier.darkTheme ? Colors.black : Colors.white,
              ),
              onTap: () {
                notifier.toggleTheme();
              },
            ),
          ),
          SizedBox(
            width: 30.0,
          )
        ]);
  }
}
