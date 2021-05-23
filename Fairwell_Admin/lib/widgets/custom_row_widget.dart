import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  String title;
  String value;
  CustomRowWidget({@required this.title, @required this.value});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: width * 0.044),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.06, vertical: height * 0.006),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.05),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            value,
            style:
                TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
