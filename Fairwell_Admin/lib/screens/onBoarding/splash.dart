import 'dart:async';

import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void moveToNextScreen(BuildContext ctx) {
    _moveToLoginVC(context);
  }

  _startTimer() {
    Timer(Duration(seconds: 3, milliseconds: 500), () {
      moveToNextScreen(context);
    });
  }

  _moveToLoginVC(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) {
          return LoginScreen();
        },
      ),
    );
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: width * 0.35,
                    height: width * 0.35,
                    image: AssetImage('resources/images/logo.png'),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    'fairwell',
                    style: TextStyle(fontSize: width * 0.125),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height * 0.03),
                    height: width * 0.01,
                    width: width * 0.5,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          CustomColor.fromHex(ColorConstants.grey)),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: height * 0.05),
                child: Text(
                  'Admin Dashboard',
                  style: TextStyle(
                    fontSize: width * 0.055,
                    color: CustomColor.fromHex(ColorConstants.blue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
