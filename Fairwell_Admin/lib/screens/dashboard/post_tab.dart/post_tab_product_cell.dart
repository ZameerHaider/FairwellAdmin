import 'package:Fairwell_Admin/screens/dashboard/post_tab.dart/edit_post_screen.dart';
import 'package:Fairwell_Admin/screens/dashboard/post_tab.dart/product_object.dart';
import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:Fairwell_Admin/widgets/action_widget.dart';
import 'package:flutter/material.dart';

class PostTabProductCell extends StatelessWidget {
  ProductObject productObject;
  bool isEdit;
  PostTabProductCell({this.productObject, this.isEdit = true});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;
        return Container(
          margin: EdgeInsets.symmetric(vertical: width * 0.02),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width * 0.25,
                height: width * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productObject.image),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(width * 0.01),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: width * 0.01),
                    child: Text(productObject.name),
                  ),
                  SizedBox(
                    height: width * 0.01,
                  ),
                  Text(
                    productObject.price,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: width * 0.05),
                  ),
                  SizedBox(
                    height: width * 0.03,
                  ),
                  isEdit
                      ? Row(
                          children: [
                            ActionWidget(
                              image: 'resources/images/ic_edit.png',
                              title: 'Edit post',
                              titleColor: Colors.blue,
                              onClickAction: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return EditPostScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            ActionWidget(
                              image: 'resources/images/ic_delete.png',
                              title: 'Remove Post',
                              titleColor: Colors.red,
                              onClickAction: () {},
                            ),
                          ],
                        )
                      : Text(
                          productObject.numberOfView + ' views',
                          style: TextStyle(
                              color: Colors.grey, fontSize: width * 0.055),
                        ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
