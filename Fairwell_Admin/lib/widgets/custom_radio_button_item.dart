import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

class CustomRadioButtonItem extends StatelessWidget {
  bool isSelected;
  String text;
  CustomRadioButtonItem({this.isSelected, this.text});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: width * 0.04,
            width: width * 0.04,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                width: 1.5,
                color: isSelected
                    ? CustomColor.fromHex(ColorConstants.selected_blue)
                    : Colors.grey,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      height: width * 0.02,
                      width: width * 0.02,
                      decoration: BoxDecoration(
                          color:
                              CustomColor.fromHex(ColorConstants.selected_blue),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                : Container(),
          ),
          SizedBox(
            width: width * 0.01,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: width * 0.04,
                color: isSelected
                    ? CustomColor.fromHex(ColorConstants.selected_blue)
                    : Colors.grey),
          ),
        ],
      ),
    );
  }
}
