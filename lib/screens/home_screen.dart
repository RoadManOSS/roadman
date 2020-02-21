import 'package:flutter/material.dart';
import 'package:roadman/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginState();
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
  Future checkLoginState() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("loggedIn") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
              (Route<dynamic> route) => false);
    } else {

    }
  }
}
