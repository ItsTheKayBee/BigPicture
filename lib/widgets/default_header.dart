import 'package:big_picture/constants/styles.dart';
import 'package:flutter/material.dart';

class DefaultHeader extends StatelessWidget {
  final IconData headingIcon;
  final String headingTitle;

  DefaultHeader({required this.headingIcon, required this.headingTitle});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: HeaderClipper(),
      child: Container(
        color: Colors.black,
        height: size.height * 0.24,
        child: Padding(
          padding: EdgeInsets.only(
            top: size8 + size2,
            left: size8,
            right: size8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  headingIcon,
                  size: size2 * 7,
                  color: Color(0x8f163e57),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size4,
                  bottom: size4,
                ),
                child: Text(
                  headingTitle,
                  style: headingStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  static const double offset = 32;
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..lineTo(offset, size.height - offset)
      ..lineTo(size.width, size.height - offset)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
