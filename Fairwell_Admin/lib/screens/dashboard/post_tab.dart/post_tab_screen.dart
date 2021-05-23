import 'package:Fairwell_Admin/screens/dashboard/post_tab.dart/post_tab_product_cell.dart';
import 'package:Fairwell_Admin/screens/dashboard/post_tab.dart/product_object.dart';
import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:Fairwell_Admin/widgets/border_container.dart';
import 'package:Fairwell_Admin/widgets/custom_row_widget.dart';
import 'package:Fairwell_Admin/widgets/user_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PostTabScreen extends StatelessWidget {
  List productItems = [
    ProductObject(
        image: 'https://picsum.photos/id/1047/200/300',
        name: 'Antique Style Men Perfume',
        price: '150 KD',
        numberOfView: '70,368'),
    ProductObject(
        image: 'https://picsum.photos/id/1047/200/300',
        name: 'O2 Patch for life',
        price: '20 KD',
        numberOfView: '65,267'),
    ProductObject(
        image: 'https://picsum.photos/id/1047/200/300',
        name: 'Honda Bike 125 CC',
        price: '11,550 KD',
        numberOfView: '62,009'),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: height * 0.02, horizontal: width * 0.04),
          child: Column(
            children: [
              CustomRowWidget(title: 'Total Posts:', value: '12,030'),
              SizedBox(
                height: height * 0.02,
              ),
              BorderContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Posts Uploaded Today:',
                      style: TextStyle(fontSize: width * 0.05),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => Divider(
                              color: Colors.grey,
                            ),
                        itemCount: productItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PostTabProductCell(
                            productObject: productItems[index],
                          );
                        }),
                  ],
                ),
              ),
              BorderContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top view items:',
                      style: TextStyle(fontSize: width * 0.05),
                    ),
                    SizedBox(
                      height: height * 0.003,
                    ),
                    Text(
                      '1st Mar - 1st April',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => Divider(
                              color: Colors.grey,
                            ),
                        itemCount: productItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PostTabProductCell(
                            productObject: productItems[index],
                            isEdit: false,
                          );
                        }),
                  ],
                ),
              ),
              BorderContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Viewed Sellers',
                      style: TextStyle(fontSize: width * 0.05),
                    ),
                    SizedBox(
                      height: height * 0.003,
                    ),
                    Text(
                      '1st Mar - 1st April',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.01,
                      ),
                      children: [
                        CustomUserWidget(
                          userProfileImage:
                              'https://picsum.photos/id/1018/200/300',
                          userName: 'Mohammad Ali',
                          starsCount: 5,
                          numberOfReviews: '156',
                          isEdit: true,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomUserWidget(
                          userProfileImage:
                              'https://picsum.photos/id/1018/200/300',
                          userName: 'Mohammad Ali',
                          starsCount: 5,
                          numberOfReviews: '156',
                          isEdit: true,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomUserWidget(
                          userProfileImage:
                              'https://picsum.photos/id/1018/200/300',
                          userName: 'Mohammad Ali',
                          starsCount: 5,
                          numberOfReviews: '156',
                          isEdit: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BorderContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Posts in each category',
                      style: TextStyle(fontSize: width * 0.05),
                    ),
                    SizedBox(
                      height: height * 0.006,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.01,
                                  vertical: height * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Cosmetics',
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: CustomColor.fromHex(
                                          ColorConstants.text_grey),
                                    ),
                                  ),
                                  Text(
                                    '245',
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
                                  horizontal: width * 0.01,
                                  vertical: height * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Furniture',
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: CustomColor.fromHex(
                                          ColorConstants.text_grey),
                                    ),
                                  ),
                                  Text(
                                    '139',
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
                              percent: 0.4,
                              backgroundColor: Colors.grey,
                              progressColor: CustomColor.fromHex(
                                  ColorConstants.progress_green),
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
                                  horizontal: width * 0.01,
                                  vertical: height * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Electronics',
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: CustomColor.fromHex(
                                          ColorConstants.text_grey),
                                    ),
                                  ),
                                  Text(
                                    '34',
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
                              percent: 0.3,
                              backgroundColor: Colors.grey,
                              progressColor: CustomColor.fromHex(
                                  ColorConstants.progress_orange),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BorderContainer(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Earning from App',
                            style: TextStyle(fontSize: width * 0.05),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '15 April - 21 April',
                            style: TextStyle(
                              fontSize: width * 0.04,
                              color: CustomColor.fromHex(
                                  ColorConstants.unselected_grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
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
                            colors: [CustomColor.fromHex(ColorConstants.blue)],
                            belowBarData: BarAreaData(
                              show: true,
                              colors: [
                                CustomColor.fromHex(ColorConstants.blue)
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
                                showTitle: true,
                                titleText: 'Value',
                                margin: 10),
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
                    )
                  ],
                ),
              ),
              BorderContainer(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Earning from App',
                            style: TextStyle(fontSize: width * 0.05),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '15 April - 21 April',
                            style: TextStyle(
                              fontSize: width * 0.04,
                              color: CustomColor.fromHex(
                                  ColorConstants.unselected_grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
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
                              CustomColor.fromHex(ColorConstants.graph_color_3)
                            ],
                            belowBarData: BarAreaData(
                              show: true,
                              colors: [
                                CustomColor.fromHex(
                                        ColorConstants.graph_color_3)
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
                                showTitle: true,
                                titleText: 'Value',
                                margin: 10),
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
