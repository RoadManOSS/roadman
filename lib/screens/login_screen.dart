import 'package:flutter/material.dart';
import 'package:roadman/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 SharedPreferences sharedPreferences;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAppLaunchState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  Future checkAppLaunchState() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("onBoarding") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => OnboardingScreen()), (Route<dynamic> route) => false);
    }
  }
}
