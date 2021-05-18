import 'package:Fairwell_Admin/managers/application_shared_instance.dart';
import 'package:flutter/material.dart';

class SlideMenu extends StatefulWidget {
  final Widget child;
  final List<Widget> menuItems;

  SlideMenu({this.child, this.menuItems});

  @override
  _SlideMenuState createState() => new _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    var shared = ApplicationSharedInstance();
    shared.slideMenuAnimationController = null;
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(-0.4, 0.0),
    ).animate(
      CurveTween(curve: Curves.decelerate).animate(_controller),
    );

    return GestureDetector(
      onHorizontalDragUpdate: (data) {
        // we can access context.size here
        setState(() {
          var shared = ApplicationSharedInstance();
          if (shared.slideMenuAnimationController != null) {
            if (shared.slideMenuAnimationController != _controller) {
              shared.slideMenuAnimationController.animateTo(.0);
            }
          }

          _controller.value -= data.primaryDelta / context.size.width;
        });
      },
      onHorizontalDragEnd: (data) {
        if (data.primaryVelocity > 2500) {
          //close menu on fast swipe in the right direction
          _controller.animateTo(.0);
        } else if (_controller.value >= .5 || data.primaryVelocity < -2500) {
          // fully open if dragged a lot to left or on fast swipe to left
          _controller.animateTo(1.0);
        } else {
          // close if none of above
          _controller.animateTo(.0);
        }
        var shared = ApplicationSharedInstance();
        shared.slideMenuAnimationController = _controller;
      },
      child: Stack(
        children: <Widget>[
          SlideTransition(position: animation, child: widget.child),
          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraint) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Stack(
                      children: <Widget>[
                        Positioned(
                          right: .0,
                          top: .0,
                          bottom: .0,
                          width: constraint.maxWidth * animation.value.dx * -1,
                          child: Container(
                            child: Row(
                              children: widget.menuItems.map((child) {
                                return Expanded(
                                  child: child,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
      onTap: () {
        _controller.animateTo(.0);
      },
    );
  }
}
