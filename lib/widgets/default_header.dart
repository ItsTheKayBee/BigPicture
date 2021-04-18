import 'package:big_picture/constants/styles.dart';
import 'package:flutter/material.dart';

class DefaultHeader extends StatelessWidget {
  final IconData headingIcon;
  final String headingTitle;

  DefaultHeader({required this.headingIcon, required this.headingTitle});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(64),
        ),
      ),
      height: size.height * 0.25,
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
    );
  }
}

/* 
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, 0.6 * size.height)
      ..quadraticBezierTo(
        0,
        size.height,
        0.4 * size.width,
        size.height,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
 */