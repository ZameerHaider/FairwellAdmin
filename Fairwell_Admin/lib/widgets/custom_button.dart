import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final bool isTitleBold;
  final Color backgroundColor;
  final Color borderColor;
  final double buttonWidth;
  final double buttonHeight;
  final String icon;
  final VoidCallback onPress;
  final CustomButtonType buttonType;
  CustomButton({
    this.title = '',
    this.borderColor,
    this.backgroundColor,
    this.titleColor,
    this.isTitleBold = false,
    this.buttonWidth,
    this.buttonHeight,
    this.onPress,
    this.icon,
    this.buttonType = CustomButtonType.none,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: buttonHeight == null ? height * 0.07 : buttonHeight,
      width: buttonWidth == null ? width * 0.9 : buttonWidth,
      child: SizedBox(
        width: double.infinity,
        child: buttonType == CustomButtonType.flat ||
                buttonType == CustomButtonType.none
            ? FlatButton(
                onPressed: onPress,
                textColor: titleColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    width * 0.015,
                  ),
                  side: BorderSide(
                    color:
                        borderColor == null ? Colors.transparent : borderColor,
                    // width: width * 0.01,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon == null
                        ? Container()
                        : Container(
                            padding: EdgeInsets.only(right: width * 0.07),
                            width: width * 0.04,
                            height: width * 0.04,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: ExactAssetImage(icon))),
                          ),
                    Text(
                      this.title,
                      style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight:
                            isTitleBold ? FontWeight.bold : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                color: backgroundColor,
              )
            : RaisedButton(
                onPressed: onPress,
                textColor: titleColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    width * 0.02,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon == null
                        ? Container()
                        : Container(
                            padding: EdgeInsets.only(right: width * 0.07),
                            width: width * 0.05,
                            height: width * 0.05,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: ExactAssetImage(icon))),
                          ),
                    Text(
                      this.title,
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight:
                            isTitleBold ? FontWeight.bold : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                color: backgroundColor,
              ),
      ),
    );
  }
}
