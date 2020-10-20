import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tp_final/theme/theme.dart';

Widget myDrawer(BuildContext context) {
  return Drawer(
    elevation: 10.0,
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 50.0,
              child: Icon(
                FontAwesomeIcons.tv,
                color: Colors.blue,
                size: 60.0,
              ),
            ),
          ),
        ),
        Container(
          child: Consumer<ThemeNotifier>(
            builder: (context, notifier, child) => SwitchListTile(
              title: Text("Тема".toUpperCase()),
              onChanged: (val) {
                notifier.toggleTheme();
              },
              value: notifier.darkTheme,
            ),
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
      ],
    ),
  );
}
