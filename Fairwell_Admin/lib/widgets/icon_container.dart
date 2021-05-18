import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final Widget widget;
  final String icon;
  final double paddingRight;
  final double paddingBottom;
  IconContainer(
      {this.icon, this.paddingBottom, this.paddingRight, this.widget});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.grey,
      height: size.height * 0.165,

      //margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.14,
              decoration: BoxDecoration(
                  color: CustomColor.fromHex(ColorConstants.black),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.05),
                  child: this.widget,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: size.width * 0.07),
              child: Container(
                height: size.width * 0.3,
                width: size.width * 0.3,
                child: Image.asset(
                  this.icon,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
