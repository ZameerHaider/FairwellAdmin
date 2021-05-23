import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

class DashboardContainerWidget extends StatelessWidget {
  Widget child;
  DashboardContainerWidget({@required this.child});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(size.width * 0.02),
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColor.fromHex(ColorConstants.border_grey),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(size.width * 0.02),
        ),
      ),
      child: this.child,
    );
  }
}
