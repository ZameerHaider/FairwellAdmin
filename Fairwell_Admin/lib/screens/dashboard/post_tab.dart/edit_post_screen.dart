import 'package:Fairwell_Admin/widgets/custom_button_new.dart';
import 'package:Fairwell_Admin/widgets/custom_photo_widget.dart';
import 'package:flutter/material.dart';

class EditPostScreen extends StatelessWidget {
  List images = [
    "https://picsum.photos/id/1015/200/300",
    "https://picsum.photos/id/1015/200/300",
    "https://picsum.photos/id/1015/200/300",
    "https://picsum.photos/id/1015/200/300",
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget _itemDetailView(BuildContext context, String title, String detail) {
      return Row(
        children: [
          Text('$title: ', style: TextStyle(fontSize: width * 0.04)),
          SizedBox(
            width: width * 0.02,
          ),
          Text(
            detail,
            style: TextStyle(fontSize: width * 0.04),
          ),
          SizedBox(
            width: width * 0.03,
          ),
          Image(
            width: width * 0.04,
            height: width * 0.04,
            fit: BoxFit.cover,
            image: AssetImage('resources/images/ic_edit.png'),
          ),
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Images:'),
              SizedBox(
                height: height * 0.015,
              ),
              CustomPhotoWidget(
                items: images,
                onClickCross: () {},
              ),
              SizedBox(
                height: height * 0.015,
              ),
              _itemDetailView(context, 'Categoy', 'Men Fashion'),
              SizedBox(
                height: height * 0.02,
              ),
              _itemDetailView(context, 'Title', 'Antique Style Men Perfume'),
              SizedBox(
                height: height * 0.02,
              ),
              _itemDetailView(context, 'Price', '150 KD'),
              SizedBox(
                height: height * 0.02,
              ),
              _itemDetailView(context, 'Condition', 'Used'),
              SizedBox(
                height: height * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(fontSize: width * 0.04),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Image(
                        width: width * 0.04,
                        height: width * 0.04,
                        fit: BoxFit.cover,
                        image: AssetImage('resources/images/ic_edit.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Text('New item never used',
                      style: TextStyle(fontSize: width * 0.04)),
                  Text('Portable', style: TextStyle(fontSize: width * 0.04)),
                  Text('Comes with handy accessories',
                      style: TextStyle(fontSize: width * 0.04)),
                ],
              ),
              SizedBox(
                height: height * 0.1,
              ),
              CustomButtonNew(
                title: 'Save Changed',
                onPress: () {},
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    fit: BoxFit.cover,
                    image: AssetImage('resources/images/ic_delete.png'),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    'Remove This Post',
                    style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
