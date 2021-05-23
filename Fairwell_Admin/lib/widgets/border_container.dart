import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  Widget child;
  BorderContainer({this.child});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: height * 0.02),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.025, vertical: height * 0.015),
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColor.fromHex(ColorConstants.border_grey),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(width * 0.02),
        ),
      ),
      child: child,
    );
  }
}
