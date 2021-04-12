import 'package:flutter/material.dart';

class ScrollableViewClipper extends CustomClipper<Path> {
  double parentHeight;
  double heightPercentage;
  double widthPercentage;
  double radialOffset;

  ScrollableViewClipper({
    this.parentHeight,
    this.heightPercentage,
    this.widthPercentage,
    this.radialOffset,
  });

  @override
  getClip(Size size) {
    final double height = size.height;
    final double width = size.width;
    return Path()
      ..lineTo(0, height)
      ..lineTo(width, height)
      ..lineTo(width, parentHeight * heightPercentage)
      ..lineTo(
        width * widthPercentage + radialOffset,
        parentHeight * heightPercentage,
      )
      ..quadraticBezierTo(
        width * widthPercentage,
        parentHeight * heightPercentage,
        width * widthPercentage,
        parentHeight * heightPercentage - radialOffset,
      )
      ..lineTo(
        width * widthPercentage,
        parentHeight * heightPercentage - radialOffset,
      )
      ..lineTo(width * widthPercentage, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
