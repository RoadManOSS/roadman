import 'package:flutter/material.dart';
import 'package:roadman/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  Animation<double> animation;
  AnimationController _controller;
  Animation<double> _animation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ScaleTransition(
            scale: _animation,
            alignment: Alignment.center,
            child: new Image.asset(
              'assets/images/logo.png',
              height: 300,
              fit: BoxFit.cover,
            ),
          )
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this, value: 0.1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _controller.forward();
    Future.delayed(Duration(
        seconds: 5),
            (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomePage(), ),);
        });
  }
}
