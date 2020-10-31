import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tp_final/constants/colors.dart';

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
        elevation: 4.0,
        hoverColor: Colors.blue[900],
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 20.0,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, screenNav);
        });
  }
}
