import 'package:Fairwell_Admin/widgets/custom_appbar.dart';
import 'package:Fairwell_Admin/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';

class MapsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Locate Drivers',
        showBackButton: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.01, horizontal: width * 0.02),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('resources/images/map_background.png'),
          ),
        ),
        child: Column(
          children: [
            CustomSearchField(
              hintText: 'Search Drivers',
              suffixIcon: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
