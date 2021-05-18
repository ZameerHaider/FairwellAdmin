import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:Fairwell_Admin/widgets/scroll_behaviour_widget.dart';
import 'package:flutter/material.dart';

typedef void SelectionCallBack<T>(T selectionObject);

class CustomRadio<T> extends StatefulWidget {
  List<T> dataList;
  SelectionCallBack selectionCallBack;
  CustomRadio({
    this.dataList,
    this.selectionCallBack,
  });
  @override
  createState() {
    return new CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ScrollConfiguration(
      behavior: CustomScrollBehaviour(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            onTap: () {
              setState(() {
                widget.dataList
                    .forEach((element) => element.isSelected = false);
                widget.dataList[index].isSelected = true;
                widget.selectionCallBack(widget.dataList[index]);
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: width * 0.05),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: width * 0.05,
                    width: width * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.5,
                        color: Theme.of(context).textTheme.headline1.color,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        height: width * 0.03,
                        width: width * 0.03,
                        decoration: BoxDecoration(
                            color: widget.dataList[index].isSelected
                                ? CustomColor.fromHex(ColorConstants.blue)
                                : CustomColor.fromHex(ColorConstants.white),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Row(
                    children: [
                      Image(
                        image: AssetImage(widget.dataList[index].image),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Text(
                        widget.dataList[index].name,
                        style: TextStyle(fontSize: width * 0.045),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
