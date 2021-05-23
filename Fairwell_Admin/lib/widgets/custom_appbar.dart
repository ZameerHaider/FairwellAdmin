import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String title;
  final bool showBackButton;
  CustomAppBar({this.title = "", this.showBackButton = false, Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return showBackButton == false
        ? AppBar(
            title: Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: CustomColor.fromHex(ColorConstants.toolbar_blue),
          )
        : AppBar(
            leading: BackButton(
              color: Colors.white,
            ),
            title: Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: CustomColor.fromHex(ColorConstants.toolbar_blue),
          );
  }
}
