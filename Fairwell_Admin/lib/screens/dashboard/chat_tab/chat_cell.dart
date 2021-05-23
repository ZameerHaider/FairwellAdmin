import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

import 'chat_object.dart';

class ChatCell extends StatelessWidget {
  ChatObject chatObject;
  ChatCell({this.chatObject});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;
        return Container(
          margin: EdgeInsets.symmetric(vertical: width * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: width * 0.19,
                        height: width * 0.19,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(chatObject.imageChatUser1),
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * 0.13,
                        child: Container(
                          width: width * 0.21,
                          height: width * 0.21,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(chatObject.imageChatUser2),
                            ),
                            border: Border.all(
                                color: Colors.white, width: width * 0.01),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.17,
                  ),
                  Text(chatObject.chatName),
                ],
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: CustomColor.fromHex(ColorConstants.grey_button),
              )
            ],
          ),
        );
      },
    );
  }
}
