import 'package:flutter/material.dart';
import '../utilities/application_constants.dart';
import '../utilities/extensions.dart';

typedef void CustomTextFieldOnChangeCallBack(TextEditingController text);

class OnBoardingTextField extends StatelessWidget {
  final String fieldTitle;
  final String hint;
  final bool isSecure;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool isShowCursor;
  final bool isReadOnly;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final CustomTextFieldOnChangeCallBack onChanged;

  OnBoardingTextField({
    this.fieldTitle,
    this.textEditingController,
    this.hint = '',
    this.isSecure = false,
    this.prefixIcon,
    this.suffixIcon,
    this.isShowCursor = true,
    this.isReadOnly = false,
    this.onChanged,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var isMobileLayout = shortestSide < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: height * 0.01,
          ),
          width: isMobileLayout ? width * 0.9 : width * 0.65,
          child: TextField(
            cursorColor: CustomColor.fromHex(ColorConstants.white),
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobileLayout ? width * 0.045 : width * 0.03,
            ),
            showCursor: isShowCursor,
            autocorrect: false,
            controller: this.textEditingController,
            readOnly: this.isReadOnly,
            obscureText: this.isSecure,
            keyboardType: textInputType,
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  CustomColor.fromHex(ColorConstants.white).withOpacity(0.2),
              contentPadding: EdgeInsets.only(
                top: width * 0.05,
                bottom: width * 0.05,
                right: 0,
                left: MediaQuery.of(context).size.width * 0.035,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: CustomColor.fromHex(ColorConstants.white),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.1,
                  style: BorderStyle.solid,
                  color: CustomColor.fromHex(ColorConstants.black)
                      .withOpacity(0.1),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
              ),
              labelText: this.hint,
              labelStyle: TextStyle(
                color: CustomColor.fromHex(ColorConstants.white),
              ),
              prefixIcon: this.prefixIcon,
              suffixIcon: this.suffixIcon,
            ),
            onChanged: (text) => this.onChanged(textEditingController),
          ),
        ),
      ],
    );
  }
}
