import 'package:Fairwell_Admin/screens/dashboard/orders_tab/order_details/shopping_bag_object.dart';
import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:flutter/material.dart';

class OrderItemCell extends StatelessWidget {
  Product product;
  OrderItemCell({this.product});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;
        return Container(
          margin: EdgeInsets.symmetric(vertical: width * 0.025),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.16,
                height: width * 0.16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(width * 0.01),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(product.image),
                  ),
                ),
              ),
              SizedBox(width: width * 0.04),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.productName,
                          style: TextStyle(fontSize: width * 0.05),
                        ),
                        SizedBox(
                          height: width * 0.01,
                        ),
                        Container(
                          width: width * 0.45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.transparent,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Quantity:',
                                    style: TextStyle(fontSize: width * 0.035),
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: width * 0.005,
                                        horizontal: width * 0.006),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: CustomColor.fromHex(
                                            ColorConstants.blue),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(width * 0.02),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          product.quantity,
                                          style:
                                              TextStyle(fontSize: width * 0.04),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          size: width * 0.05,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      product.totalPrice,
                      style: TextStyle(fontSize: width * 0.055),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
