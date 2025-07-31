import 'package:flutter/material.dart';

class Styles {
  static double padding = 16.0;
  static double bottomPadding = 100;

  static EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: padding);
  static EdgeInsets withBottomPadding =
      EdgeInsets.symmetric(horizontal: padding).copyWith(bottom: bottomPadding);
}
