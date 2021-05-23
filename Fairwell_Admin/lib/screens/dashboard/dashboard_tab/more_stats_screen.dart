import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:Fairwell_Admin/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class MoreStatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget _statsOverviewWidget(
        BuildContext context, String total, String name) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            total,
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.06),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Text(name),
        ],
      );
    }

    Widget _statsDetailContainer(String heading, List widgetsList) {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.02,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: CustomColor.fromHex(ColorConstants.border_grey),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(width * 0.03),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.01),
              child: Text(
                'General Stats:',
                style: TextStyle(fontSize: width * 0.045),
              ),
            ),
            Divider(
              color: CustomColor.fromHex(ColorConstants.divider_grey),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.01),
              child: Row(
                children: [
                  widgetsList[0],
                  SizedBox(
                    width: width * 0.1,
                  ),
                  widgetsList[1],
                ],
              ),
            ),
            widgetsList.length > 3
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.04, vertical: height * 0.02),
                    child: widgetsList[2],
                  )
                : Container(),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      );
    }

    List widgetItem1 = [
      _statsOverviewWidget(context, '246', 'Used Items'),
      _statsOverviewWidget(context, '5,403', 'New Items'),
      _statsOverviewWidget(context, '158', 'Items eligible for delivery'),
    ];

    List widgetItem2 = [
      _statsOverviewWidget(context, '246', 'Busy Drivers'),
      _statsOverviewWidget(context, '15', 'Idle Drivers'),
      _statsOverviewWidget(context, '35:13 min', 'Average delivery time'),
    ];

    List widgetItem3 = [
      _statsOverviewWidget(context, '347', 'Deposits'),
      _statsOverviewWidget(context, '290', 'Money Transfer'),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'More Stats',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _statsOverviewWidget(context, '569', 'Orders'),
                    _statsOverviewWidget(context, '146', 'Inspections'),
                    _statsOverviewWidget(context, '297', 'Promoted items'),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              _statsDetailContainer('General Stats', widgetItem1),
              _statsDetailContainer('Driver Stats', widgetItem2),
              _statsDetailContainer('Financial Stats', widgetItem3),
            ],
          ),
        ),
      ),
    );
  }
}
