import 'package:Fairwell_Admin/screens/dashboard/dashboard_tab/app_visitor_object.dart';
import 'package:Fairwell_Admin/screens/dashboard/dashboard_tab/maps_screen.dart';
import 'package:Fairwell_Admin/screens/dashboard/dashboard_tab/more_stats_screen.dart';
import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:Fairwell_Admin/widgets/custom_row_widget.dart';
import 'package:Fairwell_Admin/widgets/dashboard_container_widget.dart';
import 'package:Fairwell_Admin/widgets/further_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardTabScreen extends StatelessWidget {
  List<charts.Series> seriesList;

  DashboardTabScreen() {
    seriesList = _createSampleData();
  }

  static List<charts.Series<AppVisitorObject, String>> _createSampleData() {
    final data = [
      AppVisitorObject('M', 250),
      AppVisitorObject('T', 500),
      AppVisitorObject('W', 700),
      AppVisitorObject('T', 300),
      AppVisitorObject('F', 500),
      AppVisitorObject('S', 350),
      AppVisitorObject('S', 250),
    ];

    return [
      new charts.Series<AppVisitorObject, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (AppVisitorObject sales, _) => sales.day,
        measureFn: (AppVisitorObject sales, _) => sales.visitors,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.02),
          child: Column(
            children: [
              DashboardContainerWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Number of App Visitors',
                      style: TextStyle(fontSize: size.width * 0.05),
                    ),
                    SizedBox(
                      height: size.height * 0.006,
                    ),
                    Text(
                      '15 April - 21 April',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color:
                            CustomColor.fromHex(ColorConstants.unselected_grey),
                      ),
                    ),
                    Container(
                      height: size.height * 0.3,
                      child: charts.BarChart(
                        seriesList,
                        barGroupingType: charts.BarGroupingType.grouped,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              DashboardContainerWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Products in each category',
                      style: TextStyle(fontSize: size.width * 0.05),
                    ),
                    SizedBox(
                      height: size.height * 0.006,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01,
                                  vertical: size.height * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Cosmetics',
                                    style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      color: CustomColor.fromHex(
                                          ColorConstants.text_grey),
                                    ),
                                  ),
                                  Text(
                                    '245',
                                    style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      color: CustomColor.fromHex(
                                          ColorConstants.text_grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            LinearPercentIndicator(
                              lineHeight: size.height * 0.015,
                              percent: 0.7,
                              backgroundColor: Colors.grey,
                              progressColor: Colors.blue,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01,
                                  vertical: size.height * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Furniture',
                                    style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      color: CustomColor.fromHex(
                                          ColorConstants.text_grey),
                                    ),
                                  ),
                                  Text(
                                    '139',
                                    style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      color: CustomColor.fromHex(
                                          ColorConstants.text_grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            LinearPercentIndicator(
                              lineHeight: size.height * 0.015,
                              percent: 0.4,
                              backgroundColor: Colors.grey,
                              progressColor: CustomColor.fromHex(
                                  ColorConstants.progress_green),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01,
                                  vertical: size.height * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Electronics',
                                    style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      color: CustomColor.fromHex(
                                          ColorConstants.text_grey),
                                    ),
                                  ),
                                  Text(
                                    '34',
                                    style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      color: CustomColor.fromHex(
                                          ColorConstants.text_grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            LinearPercentIndicator(
                              lineHeight: size.height * 0.015,
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
              SizedBox(
                height: size.height * 0.03,
              ),
              CustomRowWidget(title: 'Total Earning', value: '\$ 50,450'),
              SizedBox(
                height: size.height * 0.03,
              ),
              DashboardContainerWidget(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Earning from App',
                            style: TextStyle(fontSize: size.width * 0.05),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '15 April - 21 April',
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              color: CustomColor.fromHex(
                                  ColorConstants.unselected_grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
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
                              CustomColor.fromHex(ColorConstants.graph_color_1)
                            ],
                            belowBarData: BarAreaData(
                              show: true,
                              colors: [
                                CustomColor.fromHex(
                                        ColorConstants.graph_color_1)
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
              SizedBox(
                height: size.height * 0.03,
              ),
              DashboardContainerWidget(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top Searched Items',
                    style: TextStyle(fontSize: size.width * 0.05),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: size.width * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: size.width * 0.12,
                                  lineWidth: 4.0,
                                  percent: 0.90,
                                  center: new Text("76%"),
                                  progressColor: Colors.blue,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text('Men Perfume')
                              ],
                            ),
                            Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: size.width * 0.12,
                                  lineWidth: 4.0,
                                  percent: 0.90,
                                  center: new Text("43%"),
                                  progressColor: Colors.green,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text('Hand Bag')
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: size.width * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: size.width * 0.12,
                                  lineWidth: 4.0,
                                  percent: 0.90,
                                  center: new Text("87%"),
                                  progressColor: Colors.amber,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text('Honda Bike')
                              ],
                            ),
                            Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: size.width * 0.12,
                                  lineWidth: 4.0,
                                  percent: 0.87,
                                  center: new Text("12%"),
                                  progressColor: Colors.purple,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text('Laptop')
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ],
                  ),
                ],
              )),
              FurtherActionWidget(
                image: 'resources/images/ic_delivery_blue.png',
                title: 'Locate Drivers',
                onClickAction: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return MapsScreen();
                      },
                    ),
                  );
                },
              ),
              FurtherActionWidget(
                image: 'resources/images/ic_stats.png',
                title: 'View More Stats',
                onClickAction: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return MoreStatsScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
