
import 'package:final_gallery_app/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'views/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => SplashScreen(),
        'HomePage':(context) => HomePage(),
      }
    ),
  );
}
