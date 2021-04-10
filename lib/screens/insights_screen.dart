import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/widgets/default_header.dart';
import 'package:flutter/material.dart';

class InsightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: size8 + size2,
        left: size8,
        right: size8,
      ),
      child: DefaultHeader(
        headingIcon: Icons.insights,
        headingTitle: insightsTitle,
      ),
    );
  }
}
