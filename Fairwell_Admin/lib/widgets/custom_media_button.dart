import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

class CustomMediaButton extends StatelessWidget {
  final String title;
  final String imageResource;
  final VoidCallback onClickMediaButton;
  CustomMediaButton({this.title, this.imageResource, this.onClickMediaButton});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onClickMediaButton();
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: size.height * 0.1,
        decoration: BoxDecoration(
          border: Border.all(
            color: CustomColor.fromHex(ColorConstants.blue),
            width: size.width * 0.007,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(size.width * 0.03),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              fit: BoxFit.cover,
              image: AssetImage(imageResource),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(
              title,
              style: TextStyle(fontSize: size.width * 0.06),
            ),
          ],
        ),
      ),
    );
  }
}
