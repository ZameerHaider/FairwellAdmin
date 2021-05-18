import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/widgets/custom_button.dart';
import 'package:Fairwell_Admin/widgets/empty_state.dart';
import 'package:Fairwell_Admin/widgets/selection_object.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

typedef void SelectMultipleStaffMemberCallBack(
    List<SelectionObject> selectedList);
typedef void SelectSingleStaffMemberCallBack(SelectionObject selectedObject);

class SelectionController extends StatefulWidget {
  List<SelectionObject> choosenList;
  SelectionObject choosenMonitor;
  final SelectMultipleStaffMemberCallBack onDoneForMultiple;
  final SelectSingleStaffMemberCallBack onDoneSingle;
  final isMultiple;
  final SelectionControllerType selectionControllerType;

  SelectionController({
    this.choosenMonitor,
    this.choosenList,
    this.onDoneForMultiple,
    this.onDoneSingle,
    @required this.isMultiple,
    @required this.selectionControllerType,
  });

  @override
  _SelectionControllerState createState() => _SelectionControllerState();
}

class _SelectionControllerState extends State<SelectionController> {
  final searchtxt = TextEditingController();
  List<SelectionObject> array = [];
  SelectionObject selectedObject;
  bool isLoading = false;
  bool isNoData = false;
  bool loadMore = false;
  int pageNumber = 1;
  String userId = "";
  List<SelectionObject> newarray = [];

  @override
  void initState() {
    if (widget.isMultiple && widget.choosenList.isNotEmpty) {
      array.clear();

      for (int i = 0; i < widget.choosenList.length; i++) {
        print(i);
        array.add(SelectionObject(
          id: widget.choosenList[i].id,
          title: widget.choosenList[i].title,
          value: widget.choosenList[i].value,
          isSelected: widget.choosenList[i].isSelected,
        ));
        setState(() {});
      }
      super.initState();
    } else {
      super.initState();

      // switch (widget.selectionControllerType) {
      //   case SelectionControllerType.addGroupMembers:
      //     _callAPIGetAllStudents();
      //     break;
      //   case SelectionControllerType.addGroupMonitor:
      //     _callAPIGetAllStudents();
      //     break;
      //   default:
      // }
    }
  }

  showHide() {
    if (array == null) {
      isNoData = true;
    } else {
      if (array.isEmpty) {
        setState(() {
          isNoData = true;
        });
      } else {
        setState(() {
          isNoData = false;
        });
      }
    }
  }

  // _callAPIGetAllStudents() {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   HelperFunctions.getFromPreference("UId").then((value) {
  //     setState(() {
  //       userId = value;
  //     });
  //   });

  //   HelperFunctions.getFromPreference("authToken").then((value) {
  //     Map<String, dynamic> body = Map<String, dynamic>();
  //     Map<String, dynamic> header = Map<String, String>();
  //     header['token'] = value;

  //     ApiManager networkCal =
  //         ApiManager(APIConstants.getStudents + userId, body, false, header);

  //     networkCal.callGetAPI().then((fResponse) {
  //       bool status = fResponse['status'];
  //       setState(() {
  //         isLoading = false;
  //       });
  //       if (status == true) {
  //         StudentListingObject studentListingObject =
  //             StudentListingObject.fromMap(fResponse);
  //         studentListingObject.data.forEach((student) {
  //           array.add(SelectionObject(
  //             id: student.userId,
  //             title: student.uName,
  //             value: student.uName,
  //             isSelected: false,
  //           ));
  //           newarray = array;
  //         });
  //         if (widget.isMultiple == false && widget.choosenMonitor != null) {
  //           // print("Chosen monitor flow");
  //           // print(array.length);
  //           for (int j = 0; j < array.length; j++) {
  //             // print("printing j:$j");
  //             // print("choosen monitor${widget.choosenMonitor.id}");
  //             // print("array monitor${array[j].id}");

  //             if (array[j].id == widget.choosenMonitor.id) {
  //               print("Match found");

  //               setState(() {
  //                 print(widget.choosenMonitor.id);
  //                 selectedObject = array[j];
  //               });

  //               setState(() {});
  //             } else {
  //               print("In else block");
  //             }
  //           }
  //         }
  //       } else {
  //         if (fResponse['msg'] != null) {
  //           HelperFunctions.showAlert(
  //             context: context,
  //             header: "Error",
  //             widget: Text(fResponse["msg"]),
  //             btnDoneText: "Ok",
  //             onDone: () {},
  //           );
  //         }
  //       }
  //       showHide();
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var isMobileLayout = shortestSide < 600;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.selectionControllerType ==
                  SelectionControllerType.addGroupMembers
              ? 'Wählen Sie Gruppenmitglieder'
              : widget.selectionControllerType ==
                      SelectionControllerType.addGroupMonitor
                  ? 'Wählen Sie Gruppenmonitor'
                  : '',
          style: TextStyle(
            fontSize: isMobileLayout
                ? MediaQuery.of(context).size.width * 0.053
                : MediaQuery.of(context).size.width * 0.023,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(65),
        //   child: Container(
        //     margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        //     padding:
        //         EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
        //     width: double.infinity,
        //     height: MediaQuery.of(context).size.width * 0.11,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     child: Center(
        //       child: TextField(
        //         textInputAction: TextInputAction.search,
        //         controller: this.searchtxt,
        //         onSubmitted: (value) {
        //           if (widget.selectionControllerType ==
        //               SelectionControllerType.students) {
        //             this.array.clear();
        //             pageNumber = 1;
        //             _callAPIGetAllStudents();
        //           }
        //         },
        //         decoration: InputDecoration(
        //           suffixIcon: GestureDetector(
        //             child: Icon(
        //               Icons.search,
        //               color: Theme.of(context).accentColor,
        //             ),
        //             onTap: () {
        //               if (widget.selectionControllerType ==
        //                   SelectionControllerType.students) {
        //                 this.array.clear();
        //                 _callAPIGetAllStudents();
        //               }
        //             },
        //           ),
        //           hintText: "Search...",
        //           hintStyle: TextStyle(
        //               fontSize: MediaQuery.of(context).size.width * 0.04),
        //           border: InputBorder.none,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ),
      body: LoadingOverlay(
        color: Colors.black26,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Colors.black38,
        ),
        isLoading: isLoading,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 9,
              child: isNoData == true
                  ? EmptyState()
                  : widget.isMultiple
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: array == null ? 0 : array.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: <Widget>[
                                CheckboxListTile(
                                  title: Text(
                                    array[index].title,
                                    style: TextStyle(
                                      fontSize: isMobileLayout
                                          ? MediaQuery.of(context).size.width *
                                              0.039
                                          : MediaQuery.of(context).size.width *
                                              0.028,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  value: array[index].isSelected,
                                  onChanged: (value) {
                                    setState(() {
                                      array[index].isSelected = value;
                                    });
                                  },
                                ),
                                Divider(
                                  color: Colors.grey[300],
                                  height: 1,
                                  thickness: 1,
                                )
                              ],
                            );
                          },
                        )
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: array == null ? 0 : array.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: <Widget>[
                                RadioListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  groupValue: selectedObject,
                                  activeColor: Theme.of(context).accentColor,
                                  value: array[index],
                                  title: Text(
                                    array[index].title,
                                    style: TextStyle(
                                      fontSize: isMobileLayout
                                          ? MediaQuery.of(context).size.width *
                                              0.039
                                          : MediaQuery.of(context).size.width *
                                              0.028,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      print(value);
                                      selectedObject = value;
                                    });
                                  },
                                ),
                                Divider(
                                  color: Colors.grey[300],
                                  height: 1,
                                  thickness: 1,
                                )
                              ],
                            );
                          },
                        ),
            ),
            Container(
              height: loadMore ? MediaQuery.of(context).size.width * 0.1 : 0.0,
              color: Colors.transparent,
              child: Center(
                child: new CircularProgressIndicator(),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width * 0.03,
                  ),
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: CustomButton(
                    onPress: () {
                      widget.isMultiple
                          ? array == []
                              ? Container()
                              : widget.onDoneForMultiple(array)
                          : selectedObject == null
                              ? Container()
                              : widget.onDoneSingle(selectedObject);

                      widget.isMultiple
                          ? array == []
                              ? Container()
                              : Navigator.pop(context)
                          : selectedObject == null
                              ? Container()
                              : Navigator.pop(context);
                    },
                    title: 'Erledigt',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
