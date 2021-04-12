import 'package:flutter/material.dart';

class MovieCastViewClipper extends CustomClipper<Path> {
  double offset = 48;
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 2 * offset)
      ..lineTo(0, size.height)
      ..quadraticBezierTo(0, size.height - offset, offset, size.height - offset)
      ..lineTo(size.width - offset, size.height - offset)
      ..quadraticBezierTo(
        size.width,
        size.height - offset,
        size.width,
        size.height - 2 * offset,
      )
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(size.width, offset, size.width - offset, offset)
      ..lineTo(offset, offset)
      ..quadraticBezierTo(0, offset, 0, 2 * offset)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
