import 'package:Fairwell_Admin/screens/dashboard/chat_tab/chat_object.dart';
import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

import 'chat_cell.dart';

class ChatScreen extends StatelessWidget {
  List list = [
    ChatObject(
        chatName: 'Sara & Naif',
        imageChatUser1: 'https://picsum.photos/id/1/200/300',
        imageChatUser2: 'https://picsum.photos/id/1001/200/300'),
    ChatObject(
        chatName: 'Mohammad & Jiak',
        imageChatUser1: 'https://picsum.photos/id/1016/200/300',
        imageChatUser2: 'https://picsum.photos/id/1015/200/300'),
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total Chats:',
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
                    '346',
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.025, vertical: height * 0.015),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CustomColor.fromHex(ColorConstants.border_grey),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(width * 0.02),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore Chats',
                      style: TextStyle(fontSize: width * 0.045),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: list.length,
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.grey,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return ChatCell(
                            chatObject: list[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
