import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/application_constants.dart';
import '../utilities/extensions.dart';

typedef void CustomTextFieldOnChangeCallBack(TextEditingController text);
typedef void CustomTextFieldOnsubmittedCallBack(TextEditingController text);

class CustomTextField extends StatelessWidget {
  final String fieldTitle;
  final String hint;
  final bool isSecure;
  final String heading;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool isShowCursor;
  final bool isReadOnly;
  final int maxLines;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final CustomTextFieldOnChangeCallBack onChanged;
  final CustomTextFieldOnsubmittedCallBack onSubmitted;

  CustomTextField(
      {this.fieldTitle,
      this.heading = '',
      this.textEditingController,
      this.hint = '',
      this.isSecure = false,
      this.prefixIcon,
      this.suffixIcon,
      this.isShowCursor = true,
      this.isReadOnly = false,
      this.onChanged,
      this.textInputType = TextInputType.text,
      this.onSubmitted,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var isMobileLayout = shortestSide < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        this.heading == ''
            ? Container(
                height: width * 0.0,
              )
            : Column(
                children: [
                  Text(
                    this.heading,
                    style: TextStyle(
                      fontSize: isMobileLayout ? width * 0.045 : width * 0.030,
                      color: CustomColor.fromHex(ColorConstants.black),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),
        Container(
          width: isMobileLayout ? width * 0.9 : width * 0.65,
          child: TextField(
            cursorColor: CustomColor.fromHex(ColorConstants.black),
            style:
                TextStyle(fontSize: width * 0.048, fontWeight: FontWeight.w500),
            showCursor: isShowCursor,
            autocorrect: false,
            controller: this.textEditingController,
            readOnly: this.isReadOnly,
            obscureText: this.isSecure,
            keyboardType: textInputType,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: this.hint,
              contentPadding: EdgeInsets.only(
                top: width * 0.04,
                bottom: width * 0.04,
                right: 0,
                left: width * 0.035,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.9,
                  style: BorderStyle.solid,
                  color: CustomColor.fromHex(ColorConstants.black),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    MediaQuery.of(context).size.width * 0.015,
                  ),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.6,
                  style: BorderStyle.solid,
                  color: CustomColor.fromHex(ColorConstants.black)
                      .withOpacity(0.6),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    MediaQuery.of(context).size.width * 0.015,
                  ),
                ),
              ),
              // labelText: this.hint,
              prefixIcon: this.prefixIcon,
              suffixIcon: this.suffixIcon,
            ),
            onSubmitted: (text) => this.onSubmitted(textEditingController),
            onChanged: (text) => this.onChanged(textEditingController),
          ),
        ),
      ],
    );
  }
}
