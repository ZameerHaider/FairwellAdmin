import 'package:flutter/material.dart';

class CustomBottomSheetCamera {
  static bottomSheet(BuildContext context, VoidCallback onpressCamera,
      VoidCallback onPressGallery) {
    double size = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            color: Colors.grey[200],
            height: size * 0.22,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: size * 0.49,
                    child: GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: size * 0.08,
                            height: size * 0.08,
                            child: Image.asset(
                              "Resources/Images/photography.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: size * 0.03,
                          ),
                          Text(
                            "Kamera",
                            style: TextStyle(
                              fontSize: size * 0.034,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    onpressCamera();
                  },
                ),
                Expanded(
                  child: VerticalDivider(),
                ),
                Container(
                  width: size * 0.49,
                  child: GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: size * 0.08,
                          height: size * 0.08,
                          child: Image.asset(
                            "Resources/Images/photo.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: size * 0.03,
                        ),
                        Text(
                          "Galerie",
                          style: TextStyle(
                            fontSize: size * 0.034,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      onPressGallery();
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
