import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roadman/utilities/styles.dart';
class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  bool _visible = true;
  AnimationController animationController;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 13 : 9,
      width: isActive ? 13 : 9,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF5BDDAF) : Color(0xFFE8E8E8),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                mColorWhite,
                mColorWhite,
                mColorWhite,
                mColorWhite,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFF041F36),
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _visible = !_visible;
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/onboarding_one.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),

                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Search',
                              style: mRobotoDark,
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Plan your trip right from your bedroom.',
                              style: mRobotoSubtitle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/onboarding_two.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),

                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Do Not Ask for Direction',
                              style: mRobotoDark,
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Plan your trip right from your bedroom.',
                              style: mRobotoSubtitle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/onboarding_three.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),

                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Security Updates',
                              style: mRobotoDark,
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Tell other road users about security threat (arm robbery, accident), traffic and so many beautiful things you feel like sharing.',
                              style: mRobotoSubtitle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Next',
                            style:mRobotoRegularSmall,
                          ),
                          SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                  ),
                )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
        height: 100.0,
        width: double.infinity,
        color: Colors.white,
        child: GestureDetector(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                'Get started',
                style: TextStyle(
                  color: Color(0xFF041F36),
                  fontFamily: 'Gilroy',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      )
          : Text(''),
    );
  }
}
