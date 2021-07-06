import 'package:firebaseapp/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      image: Image(
        image: AssetImage("images/jj.PNG"),
      ),
      navigateAfterSeconds: 5,
      loadingText: Text("Excel IT AI",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
