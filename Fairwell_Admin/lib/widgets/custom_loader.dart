import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoader extends StatelessWidget {
  Color bgcolor;
  Color loaderColor;
  final bool isLoading;
  final Widget child;
  CustomLoader({this.child, this.isLoading,this.bgcolor=Colors.black26,this.loaderColor=Colors.white});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return isLoading
        ? Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Container(
                  width: width,
                  height: height,
                  child: child,
                ),
              ),
              Positioned(
                child: Align(
                  alignment: FractionalOffset.center,
                  child: Container(
                    width: width,
                    height: height,
                    color: bgcolor,
                    child: Center(
                      child: Container(
                        width: width * 0.12,
                        height: width * 0.12,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballRotateChase,
                          color: loaderColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container(
            child: child,
          );
  }
}
