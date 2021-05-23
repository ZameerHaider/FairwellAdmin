import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {
  String image;
  String title;
  Color titleColor;
  VoidCallback onClickAction;
  ActionWidget({this.image, this.title, this.titleColor, this.onClickAction});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        onClickAction();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
          SizedBox(
            width: width * 0.005,
          ),
          Text(
            title,
            style: TextStyle(
                color: titleColor, decoration: TextDecoration.underline),
          )
        ],
      ),
    );
  }
}
