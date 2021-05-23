import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

class CustomPhotoWidget extends StatelessWidget {
  final List items;
  final VoidCallback onClickCross;
  CustomPhotoWidget({
    this.items,
    this.onClickCross,
  });
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Row(
            children: items == null
                ? []
                : items.map((e) {
                    return Padding(
                      padding: EdgeInsets.only(right: width * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        width: width * 0.25,
                        height: width * 0.25,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              child: Image.network(
                                e,
                                width: width * 0.5,
                                height: width * 0.5,
                                fit: BoxFit.fill,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                onClickCross();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(width * 0.01),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.close,
                                    size: width * 0.04,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
          ),
        ],
      ),
    );
  }
}
