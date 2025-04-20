import 'package:flutter/material.dart';
import 'dart:async';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to home screen after a delay
    Timer(Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                ThreeMonthBasedScreen()), // Replace with your home screen widget
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double loadingTextSize = MediaQuery.of(context).size.width * 0.04;
    double titleTextSize = MediaQuery.of(context).size.width * 0.055;
    double orgTextSize = MediaQuery.of(context).size.width * 0.035;
    double iconHSize = MediaQuery.of(context).size.width * 0.7;
    double iconWSize = MediaQuery.of(context).size.width * 0.75;
    double devTextSize = MediaQuery.of(context).size.width * 0.043;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 128, 0, 0),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Seventh-Day Adventist Church',
                style: TextStyle(
                  letterSpacing: 6,
                  fontSize: orgTextSize,
                  color: Colors.white,
                ),
              ),

              // Display the splash image
              Image.asset(
                'assets/chur_icon.png', // Set your splash image here
                fit: BoxFit.cover,
                width: iconWSize,
                height: iconHSize,
                //color: const Color.fromARGB(255, 139, 102, 65),
              ),
              Text(
                'Mpemba SDASongs',
                style: TextStyle(
                  letterSpacing: 6.5,
                  fontSize: titleTextSize,
                  //fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20), // Space between image and loader
              CircularProgressIndicator(
                color: Colors.white,
              ), // Loading animation
              SizedBox(height: 20), // Space for better UI
              Text(
                'Loading...',
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: loadingTextSize,
                  color: Colors.white,
                ),
              ), // Optional text below the loader
              SizedBox(height: 20),
              Text(
                'App Developed by SmartTech++',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: devTextSize, fontFamily: 'VarelaRound',
                  color: Colors.white,
                  // color:  const Color.fromARGB(255, 49, 112, 164),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
