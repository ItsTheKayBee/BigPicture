import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/widgets/default_header.dart';
import 'package:flutter/material.dart';

class InsightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultHeader(
        headingIcon: Icons.insights,
        headingTitle: insightsTitle,
      ),
    );
  }
}
