import 'package:final_gallery_app/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Controller/Provider/theme_Provider.dart';
import 'views/screens/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ThemeProvider()),
      ],
      builder: (context, _){
        return MaterialApp(
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(),
            themeMode: (Provider.of<ThemeProvider>(context).tm1.isDark == false)?ThemeMode.light:ThemeMode.dark,
            // themeMode: (Provider.of<ThemeProvider>(context).tm1.isDark == false) ? ThemeMode.light : ThemeMode.dark ,
            debugShowCheckedModeBanner: false,
            routes: {
              '/' : (context) => SplashScreen(),
              'HomePage':(context) => HomePage(),
            }
        );
      },
    ),
  );
}
