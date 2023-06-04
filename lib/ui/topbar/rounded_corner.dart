import 'package:flutter/material.dart';

BoxDecoration roundedCorner({
  required double radius,
  Color borderColor = Colors.transparent,
  Color bgColor = Colors.transparent,
  double width = 1.0,
}) {
  return BoxDecoration(
    border: Border.all(
      width: width,
      color: borderColor,
    ),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    color: bgColor,
  );
}
