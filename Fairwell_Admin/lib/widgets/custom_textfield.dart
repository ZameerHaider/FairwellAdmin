import 'package:Fairwell_Admin/utilities/helper_functions.dart';
import 'package:flutter/material.dart';
import '../utilities/application_constants.dart';
import '../utilities/extensions.dart';

typedef void CustomTextFieldOnChangeCallBack(TextEditingController text);

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isSecure;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool isShowCursor;
  final bool isReadOnly;
  final int maxLines;
  final double fieldWidth;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final CustomTextFieldOnChangeCallBack onChanged;
  final CustomTextFieldOnChangeCallBack onSubmitted;
  final bool isVisible;
  final bool enabled;
  CustomTextField(
      {this.textEditingController,
      this.hint = '',
      this.isSecure = false,
      this.prefixIcon,
      this.fieldWidth = 0.0,
      this.suffixIcon,
      this.isShowCursor = true,
      this.isReadOnly = false,
      this.onChanged,
      this.onSubmitted,
      this.textInputType = TextInputType.text,
      this.maxLines = 1,
      this.isVisible = true,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return isVisible
        ? Container(
            margin: EdgeInsets.only(bottom: width * 0.065),
            width: this.fieldWidth == 0.0 ? width * 0.9 : this.fieldWidth,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.all(
                Radius.circular(width * 0.01),
              ),
              boxShadow: [
                HelperFunctions.shadowEffectForFields(context),
              ],
            ),
            child: TextField(
              cursorColor: CustomColor.fromHex(ColorConstants.black),
              style: TextStyle(
                fontSize: width * 0.045,
              ),
              enabled: this.enabled,
              showCursor: isShowCursor,
              autocorrect: false,
              controller: this.textEditingController,
              readOnly: this.isReadOnly,
              obscureText: this.isSecure,
              keyboardType: textInputType,
              maxLines: maxLines,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: width * 0.035,
                  bottom: width * 0.03,
                  right: 0,
                  left: width * 0.035,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 10,
                    style: BorderStyle.solid,
                    color: CustomColor.fromHex(ColorConstants.black),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 10,
                      style: BorderStyle.solid,
                      color: textEditingController.text == ''
                          ? CustomColor.fromHex(ColorConstants.black)
                          : CustomColor.fromHex(ColorConstants.black)),
                ),
                labelStyle: TextStyle(
                  fontSize: width * 0.04,
                  color: CustomColor.fromHex(ColorConstants.black),
                ),
                labelText: this.hint,
                prefixIcon: this.prefixIcon,
                suffixIcon: this.suffixIcon,
              ),
              onSubmitted: (value) => this.onSubmitted(textEditingController),
              onChanged: (text) => this.onChanged(textEditingController),
            ),
          )
        : Container();
  }
}
