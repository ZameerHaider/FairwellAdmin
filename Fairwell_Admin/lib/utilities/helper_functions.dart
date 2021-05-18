import 'dart:io';
import 'package:Fairwell_Admin/widgets/custom_radio_button_item.dart';
import 'package:html/parser.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application_constants.dart';
import 'extensions.dart';

class HelperFunctions {
  static String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  static saveInPreference(String preName, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(preName, value);
    print('Bismillah: In save preference function');
  }

  static clearAllPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<String> getFromPreference(String preName) async {
    String returnValue = "";

    final prefs = await SharedPreferences.getInstance();
    returnValue = prefs.getString(preName) ?? "";
    return returnValue;
  }

  static checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true; //connected to mobile data
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true; // connected to a wifi network.
    } else {
      return false;
    }
  }

  static showAlert({
    BuildContext context,
    String header,
    Widget widget,
    String btnDoneText = "",
    String btnCancelText = "",
    bool isDissmissOnTapAround = false,
    VoidCallback onDone,
    VoidCallback onCancel,
  }) {
    Widget doneButton = FlatButton(
      child: Text(
        btnDoneText,
        style: TextStyle(
          color: CustomColor.fromHex(ColorConstants.orannge),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        onDone();
      },
    );

    Widget cancelButton = FlatButton(
      child: Text(
        btnCancelText,
        style: TextStyle(color: CustomColor.fromHex(ColorConstants.orannge)),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        onCancel();
      },
    );

    showDialog(
      barrierDismissible: isDissmissOnTapAround,
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          child: AlertDialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.02),
              ),
            ),
            title: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.03,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.1),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    header,
                    style: TextStyle(
                      color: CustomColor.fromHex(ColorConstants.black),
                    ),
                  ),
                ],
              ),
            ),
            content: widget,
            actions: <Widget>[
              btnCancelText == "" ? Container() : cancelButton,
              btnDoneText == "" ? Container() : doneButton,
            ],
          ),
        );
      },
    );
  }

  static bool isValidPassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,16}$';
    //r"^(?-i)(?=^.{8,}$)((?!.*\s)(?=.*[A-Z])(?=.*[a-z]))((?=(.*\d){1,})|(?=(.*\W){1,}))^.*$";
    // r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!(value.contains(regex))) {
      return false;
    } else {
      return true;
    }
  }

  static bool isValidEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

    RegExp regex = new RegExp(pattern);
    if (!(value.contains(regex))) {
      return false;
    } else {
      return true;
    }
  }

  static BoxShadow shadowEffect(BuildContext context) {
    return BoxShadow(
        color: CustomColor.fromHex(ColorConstants.black),
        offset: Offset(4, 4),
        blurRadius: 8,
        spreadRadius: 0.1);
  }

  static BoxShadow shadowEffectForFields(BuildContext context) {
    return BoxShadow(
        offset: Offset(0, 2),
        spreadRadius: 1,
        blurRadius: 10,
        color: Colors.black38);
  }

  static convertHtmlToString(String htmlString) {
    //here goes the function
    final document = parse(htmlString);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }

  static MaterialColor getColorValue(String newsType) {
    switch (newsType) {
      case "Rot":
        return Colors.red;
        break;

      case "Gelb":
        return Colors.yellow;
        break;

      case "Grün":
        return Colors.green;
        break;

      case "Grau":
        return Colors.grey;
        break;

      default:
        return Colors.red;
        break;
    }
  }

  static void showCategorySheet(BuildContext context, List categories) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      isScrollControlled: true, // set this to true
      builder: (_) {
        return SafeArea(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  height: height * 0.075,
                  decoration: BoxDecoration(
                    color: CustomColor.fromHex(ColorConstants.selected_blue),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Text(
                        'Categories',
                        style: TextStyle(
                            color: Colors.white, fontSize: width * 0.045),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: DraggableScrollableSheet(
                    expand: false,
                    builder: (_, controller) {
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: width * 0.01,
                            mainAxisSpacing: width * 0.02,
                          ),
                          controller: controller,
                          itemCount: categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: width * 0.03,
                                  horizontal: width * 0.03),
                              child: Column(
                                children: [
                                  Container(
                                    width: width * 0.5,
                                    height: width * 0.35,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.5,
                                        color: CustomColor.fromHex(
                                            ColorConstants.divider_grey),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(width * 0.03),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image(
                                        width: width * 0.25,
                                        height: width * 0.25,
                                        image: AssetImage(
                                            categories[index].categoryImage),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    categories[index].categoryName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.045,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static showSortDialog({
    BuildContext context,
    String header,
    Widget widget,
    String btnDoneText = "",
    String btnCancelText = "",
    bool isDissmissOnTapAround = false,
    VoidCallback onDone,
    VoidCallback onCancel,
  }) {
    showDialog(
      barrierDismissible: isDissmissOnTapAround,
      context: context,
      builder: (context) {
        var width = MediaQuery.of(context).size.width;
        var height = MediaQuery.of(context).size.height;
        return Container(
          width: double.infinity,
          child: AlertDialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.02),
              ),
            ),
            title: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRadioButtonItem(
                    isSelected: true,
                    text: 'Newest',
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  CustomRadioButtonItem(
                    isSelected: false,
                    text: 'Closset',
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  CustomRadioButtonItem(
                    isSelected: false,
                    text: 'Price: Low to High',
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  CustomRadioButtonItem(
                    isSelected: false,
                    text: 'Price: High to Low',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static showPriceDialog({
    BuildContext context,
    String header,
    Widget widget,
    String btnDoneText = "",
    String btnCancelText = "",
    bool isDissmissOnTapAround = false,
    VoidCallback onDone,
    VoidCallback onCancel,
  }) {
    showDialog(
      barrierDismissible: isDissmissOnTapAround,
      context: context,
      builder: (context) {
        var width = MediaQuery.of(context).size.width;
        var height = MediaQuery.of(context).size.height;
        return Container(
          width: double.infinity,
          child: AlertDialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.02),
              ),
            ),
            title: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width * 0.25,
                    child: TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: width * 0.01),
                            border: InputBorder.none,
                            labelText: '\$ Min')),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Text(
                    'to',
                    style: TextStyle(fontSize: width * 0.05),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Container(
                    width: width * 0.25,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: width * 0.01),
                          border: InputBorder.none,
                          labelText: '\$ Max'),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static showPostItemDialog({
    BuildContext context,
    String btnDoneText = "",
    String btnCancelText = "",
    bool isDissmissOnTapAround = true,
    VoidCallback onDone,
    VoidCallback onCancel,
  }) {
    showDialog(
      barrierDismissible: isDissmissOnTapAround,
      context: context,
      builder: (context) {
        var width = MediaQuery.of(context).size.width;
        var height = MediaQuery.of(context).size.height;
        return Container(
          child: AlertDialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.02),
              ),
            ),
            title: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Text('Item Size'),
                      Icon(Icons.close),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image(
                        image: AssetImage('resources/images/ic_box.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Text(
                    'Items have a limit of 00 centimeters cubed in order to fit in the delivery car',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    'Learn More',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: CustomColor.fromHex(ColorConstants.blue),
                        fontSize: width * 0.04),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(width * 0.02),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 0.04),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      Expanded(
                        child: Container(
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            color: CustomColor.fromHex(ColorConstants.blue),
                            borderRadius: BorderRadius.all(
                              Radius.circular(width * 0.02),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 0.04),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
