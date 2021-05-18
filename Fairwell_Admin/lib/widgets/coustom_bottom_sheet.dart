import 'package:flutter/material.dart';

class CustomBottomSheet {
  static bottomSheet({
    BuildContext context,
    bool canEdit,
    bool canDelete,
    VoidCallback onpressEdit,
    VoidCallback onPressDelete,
  }) {
    double size = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              color: Colors.grey[200],
              height: size * 0.22,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (canEdit)
                    Expanded(
                      child: GestureDetector(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: size * 0.08,
                                height: size * 0.08,
                                child: Image.asset("Resources/Images/edit.png",
                                    fit: BoxFit.cover)),
                            SizedBox(height: size * 0.03),
                            Text("Bearbeiten",
                                style: TextStyle(
                                    fontSize: size * 0.034,
                                    color: Colors.grey)),
                          ],
                        ),
                        onTap: () {
                          onpressEdit();
                        },
                      ),
                    ),
                  if (canDelete && canEdit) VerticalDivider(),
                  if (canDelete)
                    Expanded(
                      child: GestureDetector(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: size * 0.08,
                                height: size * 0.08,
                                child: Image.asset(
                                    "Resources/Images/delete.png",
                                    fit: BoxFit.cover)),
                            SizedBox(height: size * 0.03),
                            Text("Löschen",
                                style: TextStyle(
                                    fontSize: size * 0.034,
                                    color: Colors.grey)),
                          ],
                        ),
                        onTap: () {
                          onPressDelete();
                        },
                      ),
                    )
                ],
              ),
            ),
          );
        });
  }
}
