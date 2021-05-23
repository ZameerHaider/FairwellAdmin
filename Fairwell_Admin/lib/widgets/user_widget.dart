import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:Fairwell_Admin/widgets/action_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CustomUserWidget extends StatelessWidget {
  final String userProfileImage;
  final String userName;
  final bool isVerified;
  final double starsCount;
  final String numberOfReviews;
  final bool isEdit;

  CustomUserWidget(
      {this.userProfileImage,
      this.userName,
      this.isVerified = false,
      this.starsCount,
      this.numberOfReviews,
      this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: width * 0.15,
          width: width * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.8),
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                userProfileImage,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userName,
                style: TextStyle(
                  color: CustomColor.fromHex(ColorConstants.black),
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(
              height: height * 0.005,
            ),
            Row(
              children: [
                SmoothStarRating(
                  allowHalfRating: true,
                  color: Colors.yellow,
                  rating: starsCount,
                  starCount: 5,
                  size: width * 0.04,
                  borderColor: CustomColor.fromHex(ColorConstants.blue),
                  onRated: (value) {
                    print(value);
                  },
                ),
                Text(
                  "($numberOfReviews)",
                  style: TextStyle(
                      color: CustomColor.fromHex(ColorConstants.grey),
                      fontSize: width * 0.03),
                ),
                Visibility(
                  visible: isEdit,
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.03,
                      ),
                      ActionWidget(
                        title: 'Edit Rating',
                        image: 'resources/images/ic_edit.png',
                        titleColor: Colors.blue,
                        onClickAction: () {},
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
