import 'package:Fairwell_Admin/screens/dashboard/orders_tab/order_details/order_details_screen.dart';
import 'package:Fairwell_Admin/screens/dashboard/orders_tab/orders_object.dart';
import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:Fairwell_Admin/widgets/border_container.dart';
import 'package:Fairwell_Admin/widgets/custom_row_widget.dart';
import 'package:Fairwell_Admin/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OrdersTabScreen extends StatelessWidget {
  List ordersList = [
    OrdersObject(orderNumber: '182939', totalItems: '2'),
    OrdersObject(orderNumber: '340373', totalItems: '4'),
    OrdersObject(orderNumber: '8395507', totalItems: '7'),
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchField(
                hintText: 'Search Drivers',
                suffixIcon: Icon(Icons.search),
                isFromOrders: true,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomRowWidget(title: 'Total Orders Received', value: '569'),
              SizedBox(
                height: height * 0.03,
              ),
              LineChart(
                LineChartData(
                  lineTouchData: LineTouchData(enabled: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 1),
                        FlSpot(1, 1),
                        FlSpot(2, 3),
                        FlSpot(3, 4),
                        FlSpot(3, 5),
                        FlSpot(4, 4)
                      ],
                      isCurved: true,
                      barWidth: 2,
                      colors: [
                        CustomColor.fromHex(ColorConstants.graph_color_2)
                      ],
                      belowBarData: BarAreaData(
                        show: true,
                        colors: [
                          CustomColor.fromHex(ColorConstants.graph_color_2)
                              .withOpacity(0.5)
                        ],
                        cutOffY: 3,
                        applyCutOffY: true,
                      ),
                      // aboveBarData: BarAreaData(
                      //   show: true,
                      //   colors: [Colors.lightGreen.withOpacity(0.5)],
                      //   cutOffY: 3,
                      //   applyCutOffY: true,
                      // ),
                      dotData: FlDotData(
                        show: false,
                      ),
                    ),
                  ],
                  minY: 0,
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 5,
                        // textStyle: yearTextStyle,
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'M';
                            case 1:
                              return 'T';
                            case 3:
                              return 'W';
                            case 4:
                              return 'T';

                            default:
                              return '';
                          }
                        }),
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTitles: (value) {
                        return '\$ ${value + 100}';
                      },
                    ),
                  ),
                  axisTitleData: FlAxisTitleData(
                      leftTitle: AxisTitle(
                          showTitle: true, titleText: 'Value', margin: 10),
                      bottomTitle: AxisTitle(
                          showTitle: true,
                          margin: 10,
                          titleText: 'Year',
                          // textStyle: yearTextStyle,
                          textAlign: TextAlign.right)),
                  gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (double value) {
                      return value == 1 ||
                          value == 2 ||
                          value == 3 ||
                          value == 4;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomRowWidget(title: 'Current Orders', value: '12'),
              SizedBox(
                height: height * 0.03,
              ),
              BorderContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Orders',
                      style: TextStyle(fontSize: width * 0.05),
                    ),
                    Text(
                      '1st Mar - 1st April',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: ordersList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) {
                                  return OrdersDetailScreen();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Order # ${ordersList[index].orderNumber}'),
                                    Text(
                                        '${ordersList[index].totalItems} items')
                                  ],
                                ),
                                Icon(Icons.keyboard_arrow_right)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                'Orders Place By cities',
                style: TextStyle(fontSize: width * 0.05),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Al Ahmadi',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CustomColor.fromHex(
                                    ColorConstants.text_grey),
                              ),
                            ),
                            Text(
                              '532',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CustomColor.fromHex(
                                    ColorConstants.text_grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      LinearPercentIndicator(
                        lineHeight: height * 0.015,
                        percent: 0.7,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Hawalli',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CustomColor.fromHex(
                                    ColorConstants.text_grey),
                              ),
                            ),
                            Text(
                              '436',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CustomColor.fromHex(
                                    ColorConstants.text_grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      LinearPercentIndicator(
                        lineHeight: height * 0.015,
                        percent: 0.7,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Salwa',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CustomColor.fromHex(
                                    ColorConstants.text_grey),
                              ),
                            ),
                            Text(
                              '421',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CustomColor.fromHex(
                                    ColorConstants.text_grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      LinearPercentIndicator(
                        lineHeight: height * 0.015,
                        percent: 0.7,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Al Manqaf',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CustomColor.fromHex(
                                    ColorConstants.text_grey),
                              ),
                            ),
                            Text(
                              '532',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CustomColor.fromHex(
                                    ColorConstants.text_grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      LinearPercentIndicator(
                        lineHeight: height * 0.015,
                        percent: 0.7,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ar Rabiyah',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CustomColor.fromHex(
                                    ColorConstants.text_grey),
                              ),
                            ),
                            Text(
                              '436',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CustomColor.fromHex(
                                    ColorConstants.text_grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      LinearPercentIndicator(
                        lineHeight: height * 0.015,
                        percent: 0.7,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Bayan',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CustomColor.fromHex(
                                    ColorConstants.text_grey),
                              ),
                            ),
                            Text(
                              '421',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CustomColor.fromHex(
                                    ColorConstants.text_grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      LinearPercentIndicator(
                        lineHeight: height * 0.015,
                        percent: 0.7,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Al Fintas',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CustomColor.fromHex(
                                    ColorConstants.text_grey),
                              ),
                            ),
                            Text(
                              '120',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CustomColor.fromHex(
                                    ColorConstants.text_grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      LinearPercentIndicator(
                        lineHeight: height * 0.015,
                        percent: 0.7,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
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
