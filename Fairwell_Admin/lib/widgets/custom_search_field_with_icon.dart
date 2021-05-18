import 'package:Fairwell_Admin/utilities/application_constants.dart';
import 'package:Fairwell_Admin/utilities/extensions.dart';
import 'package:Fairwell_Admin/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';

class SearchWidgetWithCategory extends StatelessWidget {
  VoidCallback onClickCategory;
  VoidCallback onClickSearch;
  bool isFromHome;
  SearchWidgetWithCategory(
      {@required this.onClickCategory,
      this.onClickSearch,
      this.isFromHome = false});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: CustomColor.fromHex(ColorConstants.grey),
              width: width * 0.003),
          color: Colors.white,
          borderRadius: BorderRadius.circular(width * 0.05)),
      width: width,
      height: width * 0.14,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                onClickSearch();
              },
              child: isFromHome
                  ? AbsorbPointer(
                      child: CustomSearchField(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: 'Search item',
                      ),
                    )
                  : CustomSearchField(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintText: 'Search item',
                    ),
            ),
          ),
          SizedBox(
            width: width * 0.01,
          ),
          GestureDetector(
            onTap: () {
              onClickCategory();
            },
            child: Container(
              width: width * 0.1,
              decoration: BoxDecoration(color: Colors.white),
              child: Image(
                height: width * 0.065,
                width: width * 0.065,
                image: AssetImage('resources/images/categories.png'),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.01,
          ),
        ],
      ),
    );
  }
}
