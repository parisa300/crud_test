
import 'package:flutter/material.dart';

class AppDecoration {

  static double radiusButton = 8;

  static BoxDecoration createBottomSide(Color color) {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: color,
          width: 2.0,
        ),
      ),
    );
  }

  static BoxDecoration createCircle({Color? bgColor,
    Color? borderColor,
    required double thickness,
    required double radius}) {
    return BoxDecoration(
      color: bgColor,
      border: borderColor != null
          ? Border.all(
        width: thickness,
        color: borderColor,
      )
          : null,
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    );
  }


  static BoxDecoration shapeCornerBorder({required Color backgroundColor,
    required Color borderColor,
    required double radius}) {
    return  BoxDecoration(
      shape: BoxShape.rectangle,
      color: backgroundColor,
      border: Border.all(color: borderColor, width: 1),
      borderRadius:  BorderRadius.all(
         Radius.circular(radius),
      ),
    );
  }

  static BoxDecoration shapeGradiant({required Gradient gradiant,
    double? radius}) {
    return  BoxDecoration(
      shape: BoxShape.rectangle, gradient: gradiant,
      borderRadius:  BorderRadius.all(
         Radius.circular(radius ?? 0),
      ),
    );
  }


  static BoxDecoration shapeShadowCornerBorder({required Color backgroundColor,
    required Color borderColor,
    required double radius}) {
    return  BoxDecoration(
      shape: BoxShape.rectangle,
      color: backgroundColor,
      border: Border.all(color: borderColor, width: 1),
      borderRadius:  BorderRadius.all(
         Radius.circular(radius),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 5,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }
}
