import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.of(context).pushReplacementNamed('HomePage');
    });
  }

  @override
  void initState() {
    super.initState();

    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset("assets/images/image.png"),
            ),
            const Text(
              "Gallery",
              style: TextStyle(
                  color: Colors.black, fontSize: 35, letterSpacing: 2,fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlue.shade50,
    );
  }
}
