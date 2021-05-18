import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

class CustomButtonNew extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  CustomButtonNew({this.title, this.onPress});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        this.onPress();
      },
      child: Container(
        width: double.infinity,
        height: height * 0.065,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: width * 0.045),
        ),
        decoration: BoxDecoration(
          color: CustomColor.fromHex(ColorConstants.blue),
          borderRadius: BorderRadius.all(
            Radius.circular(width * 0.015),
          ),
        ),
      ),
    );
  }
}
