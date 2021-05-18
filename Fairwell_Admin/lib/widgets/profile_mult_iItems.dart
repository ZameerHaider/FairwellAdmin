import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

class MutlipleItems extends StatelessWidget {
  MutlipleItems({
    this.widgetList,
    this.title,
    this.listItem,
  });

  final Widget widgetList;
  final String title;
  final String listItem;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.title,
          style: TextStyle(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.w500,
            color: CustomColor.fromHex(ColorConstants.green),
          ),
        ),
        SizedBox(
          height: size.height * 0.012,
        ),
        widgetList,
        SizedBox(
          height: size.height * 0.012,
        ),
        Divider(
          height: 0,
          thickness: size.width * 0.005,
          color: CustomColor.fromHex(ColorConstants.black).withOpacity(0.2),
        ),
        SizedBox(
          height: size.height * 0.012,
        ),
      ],
    );
  }
}
