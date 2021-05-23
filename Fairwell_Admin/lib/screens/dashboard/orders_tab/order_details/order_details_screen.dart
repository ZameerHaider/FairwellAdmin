import 'package:Fairwell_Admin/screens/dashboard/orders_tab/order_details/order_item_cell.dart';
import 'package:Fairwell_Admin/screens/dashboard/orders_tab/order_details/shopping_bag_object.dart';
import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:Fairwell_Admin/widgets/custom_appbar.dart';
import 'package:Fairwell_Admin/widgets/user_widget.dart';
import 'package:flutter/material.dart';

class OrdersDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List productsList = [
      Product(
        id: "1",
        productName: "Men's Perfume",
        quantity: "3",
        totalPrice: "37 KD",
        image: "https://picsum.photos/id/122/200/300",
      ),
      Product(
        id: "2",
        productName: "Nail Polish",
        quantity: "1",
        totalPrice: "12 KD",
        image: "https://picsum.photos/id/122/200/300",
      )
    ];
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Orders Detail',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order # 182939',
                    style: TextStyle(fontSize: width * 0.05),
                  ),
                  Text(
                    '2 items',
                    style: TextStyle(
                      color: CustomColor.fromHex(ColorConstants.text_grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Divider(
                color: CustomColor.fromHex(ColorConstants.divider_grey),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: productsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return OrderItemCell(
                    product: productsList[index],
                  );
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Fee: 0.50 KD',
                    style: TextStyle(color: Colors.red, fontSize: width * 0.04),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Subtotal: ',
                        style: TextStyle(fontSize: width * 0.055),
                      ),
                      Text(
                        '49 KD',
                        style: TextStyle(
                          color: CustomColor.fromHex(ColorConstants.blue),
                          fontSize: width * 0.055,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Divider(
                color: CustomColor.fromHex(ColorConstants.divider_grey),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Seller:',
                          style: TextStyle(fontSize: width * 0.045),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomUserWidget(
                          userProfileImage:
                              'https://picsum.photos/id/1018/200/300',
                          userName: 'Naif',
                          starsCount: 5,
                          numberOfReviews: '24',
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Buyer:',
                          style: TextStyle(fontSize: width * 0.045),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomUserWidget(
                          userProfileImage:
                              'https://picsum.photos/id/1018/200/300',
                          userName: 'Ellena Grey',
                          starsCount: 5,
                          numberOfReviews: '156',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Divider(
                color: CustomColor.fromHex(ColorConstants.divider_grey),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Driver:',
                    style: TextStyle(fontSize: width * 0.045),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomUserWidget(
                    userProfileImage: 'https://picsum.photos/id/1018/200/300',
                    userName: 'Mohammad Ali',
                    starsCount: 5,
                    numberOfReviews: '156',
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Text(
                    'Avg. Delivery Time: 33 min',
                    style:
                        TextStyle(color: Colors.black, fontSize: width * 0.03),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
