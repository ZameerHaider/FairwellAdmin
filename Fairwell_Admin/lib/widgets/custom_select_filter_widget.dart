import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

class CustomSelectFilterWidget extends StatelessWidget {
  String title;
  String selectedFilter;
  VoidCallback onClickSelectFilter;
  CustomSelectFilterWidget(
      {this.title, this.selectedFilter, this.onClickSelectFilter});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        onClickSelectFilter();
      },
      child: Container(
        child: Row(
          children: [
            Text(
              title + ": " + selectedFilter,
              style: TextStyle(
                  color: CustomColor.fromHex(ColorConstants.filter_text_grey),
                  fontSize: width * 0.039),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: CustomColor.fromHex(ColorConstants.filter_text_grey),
            )
          ],
        ),
      ),
    );
  }
}
