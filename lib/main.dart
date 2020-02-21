import 'package:flutter/material.dart';
import 'package:roadman/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roadman',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
       // '/register_page': (BuildContext context) => new RegisterPage()
      },
    );
  }
}