import 'package:Fairwell_Admin/screens/dashboard/dashboard_main_screen.dart';
import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:Fairwell_Admin/widgets/custom_button.dart';
import 'package:Fairwell_Admin/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final txtUserNameController = TextEditingController();
  final txtPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.045,
          vertical: size.width * 0.045,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.width * 0.05,
            ),
            Center(
              child: Container(
                height: size.width * 0.3,
                width: size.width * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("resources/images/logo.png"))),
              ),
            ),
            SizedBox(
              height: size.width * 0.05,
            ),
            Text(
              "fairwell",
              style: TextStyle(
                  letterSpacing: size.width * 0.015,
                  color: CustomColor.fromHex(ColorConstants.black),
                  fontSize: size.width * 0.1,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Text(
              'Login to Dashboard',
              style: TextStyle(
                  fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextField(
              hint: "Username",
              textEditingController: txtUserNameController,
            ),
            SizedBox(
              height: size.width * 0.04,
            ),
            CustomTextField(
              hint: "Password",
              textEditingController: txtUserNameController,
            ),
            SizedBox(
              height: size.width * 0.065,
            ),
            CustomButton(
              title: "Login",
              backgroundColor: CustomColor.fromHex(ColorConstants.blue),
              titleColor: CustomColor.fromHex(ColorConstants.white),
              isTitleBold: true,
              onPress: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => DashboardMainScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
