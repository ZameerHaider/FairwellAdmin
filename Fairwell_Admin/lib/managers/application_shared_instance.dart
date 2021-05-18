// Singleton

import 'package:flutter/animation.dart';

class Datamanager {
  static final Datamanager _singleton = Datamanager._internal();

  factory Datamanager() {
    return _singleton;
  }

  Datamanager._internal();

  // CustomerList customerObject = CustomerList();
}

class ApplicationSharedInstance {
  static final ApplicationSharedInstance _singleton =
      ApplicationSharedInstance._internal();

  AnimationController slideMenuAnimationController;

  factory ApplicationSharedInstance() {
    return _singleton;
  }

  ApplicationSharedInstance._internal();
}
