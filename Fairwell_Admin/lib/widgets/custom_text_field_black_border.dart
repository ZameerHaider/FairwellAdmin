import 'package:flutter/material.dart';

class CustomTextFieldBlackBorder extends StatelessWidget {
  final TextEditingController textEditingController;
  final int maxLines;
  final Widget suffixWidget;
  final String hint;
  CustomTextFieldBlackBorder(
      {this.textEditingController,
      this.maxLines = 1,
      this.suffixWidget,
      this.hint = ''});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: width * 0.005),
        borderRadius: BorderRadius.all(
          Radius.circular(width * 0.015),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              maxLines: maxLines,
              textAlign: TextAlign.center,
              controller: textEditingController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: this.hint),
            ),
          ),
          suffixWidget == null ? Container() : suffixWidget,
        ],
      ),
    );
  }
}
