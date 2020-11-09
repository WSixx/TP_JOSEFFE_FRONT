import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.pushReplacementNamed(context, '/homePage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        child: WavyAnimatedTextKit(
          textStyle: TextStyle(
              fontSize: 82.0, fontWeight: FontWeight.bold, color: Colors.white),
          text: [
            "Bem Vindo",
          ],
          isRepeatingAnimation: true,
        ),
      ),
    );
  }
}
