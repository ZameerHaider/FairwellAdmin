import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final VoidCallback onClickSearchField;
  CustomSearchField(
      {this.prefixIcon,
      this.suffixIcon,
      this.hintText,
      this.onClickSearchField});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.03, horizontal: size.width * 0.02),
      child: GestureDetector(
        onTap: () {},
        child: TextField(
          cursorColor: Colors.grey,
          maxLines: 1,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                  color: Colors.grey, width: 0, style: BorderStyle.none),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                  style: BorderStyle.solid),
            ),
            hintText: hintText,
            contentPadding: EdgeInsets.all(size.width * 0.01),
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
