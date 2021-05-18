import 'package:Fairwell_Admin/managers/localization_manager.dart';
import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  final String title;
  final String description;
  final List<String> list;
  ProfileContainer({this.description, this.title, this.list});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocalizationManager.of(context).localize(
            key: this.title,
          ),
          style: TextStyle(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.w500,
            color: CustomColor.fromHex(ColorConstants.green),
          ),
        ),
        SizedBox(
          height: size.height * 0.007,
        ),
        this.description == null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: list.map((e) {
                  return Text(
                    e,
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      // fontWeight: FontWeight.w600,
                      color: CustomColor.fromHex(ColorConstants.black),
                    ),
                  );
                }).toList(),
              )
            : Text(
                this.description,
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  // fontWeight: FontWeight.w600,
                  color: CustomColor.fromHex(ColorConstants.black),
                ),
              ),
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
