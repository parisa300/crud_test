import 'package:flutter/material.dart';

class AppStyles {
  static BorderRadiusGeometry allCornerRadius(double radius) {
    return BorderRadius.circular(radius);
  }

  static BorderRadiusGeometry leftCornerRadius(double radius) {
    return BorderRadius.only(
        topLeft:  Radius.circular(radius),
        bottomLeft:  Radius.circular(radius));
  }
}