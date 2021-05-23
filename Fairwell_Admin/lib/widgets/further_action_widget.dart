import 'package:flutter/material.dart';

class FurtherActionWidget extends StatelessWidget {
  String image;
  String title;
  VoidCallback onClickAction;
  FurtherActionWidget({this.image, this.title, this.onClickAction});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        this.onClickAction();
      },
      child: Container(
        margin: EdgeInsets.only(top: height * 0.03),
        padding: EdgeInsets.symmetric(
            vertical: height * 0.015, horizontal: width * 0.02),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.all(
            Radius.circular(width * 0.03),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
                SizedBox(width: width * 0.03),
                Text(
                  title,
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
