import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> dropdownMenuItemList;
  final ValueChanged<T> onChanged;
  final T value;
  final String hint;
  final String heading;

  CustomDropdown(
      {Key key,
      @required this.dropdownMenuItemList,
      @required this.onChanged,
      @required this.value,
      @required this.hint,
      @required this.heading})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          height: height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.01),
            ),
            border: Border.all(
              color: CustomColor.fromHex(ColorConstants.blue),
              width: width * 0.005,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black38,
                size: width * 0.07,
              ),
              isExpanded: true,
              style: TextStyle(fontSize: width * 0.04, color: Colors.black),
              items: dropdownMenuItemList,
              onChanged: onChanged,
              hint: Text(hint),
              value: value,
            ),
          ),
        ),
      ],
    );
  }
}
