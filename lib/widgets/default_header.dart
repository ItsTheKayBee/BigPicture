import 'package:big_picture/constants/styles.dart';
import 'package:flutter/material.dart';

class DefaultHeader extends StatelessWidget {
  final IconData headingIcon;
  final String headingTitle;

  DefaultHeader({required this.headingIcon, required this.headingTitle});
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
