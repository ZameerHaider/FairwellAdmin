import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

class CustomTextFieldPost extends StatelessWidget {
  final TextEditingController textEditingController;
  final int maxLines;
  final Widget suffixWidget;
  CustomTextFieldPost(
      {this.textEditingController, this.maxLines = 1, this.suffixWidget});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      decoration: BoxDecoration(
        border: Border.all(
            color: CustomColor.fromHex(ColorConstants.blue),
            width: width * 0.006),
        borderRadius: BorderRadius.all(
          Radius.circular(width * 0.015),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: maxLines,
              controller: textEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          suffixWidget == null ? Container() : suffixWidget,
        ],
      ),
    );
  }
}
