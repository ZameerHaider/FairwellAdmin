import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

typedef void CustomSwitchOnChangeCallBack(bool value);

class CustomSwitchButtom extends StatelessWidget {
  final String switchTitle;
  final bool value;
  final CustomSwitchOnChangeCallBack onChange;
  CustomSwitchButtom({this.switchTitle, this.value, this.onChange});

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var isMobileLayout = shortestSide < 600;
    return Container(
      padding: EdgeInsets.only(
        left: isMobileLayout
            ? MediaQuery.of(context).size.width * 0.05
            : MediaQuery.of(context).size.width * 0.03,
      ),
      height: isMobileLayout
          ? MediaQuery.of(context).size.height * 0.064
          : MediaQuery.of(context).size.height * 0.054,
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: Colors.black26,
        ),
        color: CustomColor.fromHex("f0f0f0"),
        borderRadius: BorderRadius.circular(
          isMobileLayout
              ? MediaQuery.of(context).size.width * 0.03
              : MediaQuery.of(context).size.width * 0.018,
        ),
      ),
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.042,
        right: MediaQuery.of(context).size.width * 0.042,
        top: MediaQuery.of(context).size.height * 0.015,
        bottom: MediaQuery.of(context).size.height * 0.001,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            switchTitle,
            style: TextStyle(
              fontSize: isMobileLayout
                  ? MediaQuery.of(context).size.width * 0.035
                  : MediaQuery.of(context).size.width * 0.025,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: (value) {
              onChange(value);
            },
            activeTrackColor: Theme.of(context).accentColor.withAlpha(120),
            activeColor: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
