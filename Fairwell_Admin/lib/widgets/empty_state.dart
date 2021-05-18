import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var isMobileLayout = shortestSide < 600;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: isMobileLayout ? width * 0.4 : width * 0.2,
            height: isMobileLayout ? width * 0.4 : width * 0.2,
            child: Image.asset(
              "Resources/Images/empty.png",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "... keine Daten gefunden ...",
            style: TextStyle(
              fontSize: isMobileLayout ? width * 0.033 : width * 0.022,
            ),
          )
        ],
      ),
    );
  }
}
