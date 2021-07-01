import 'package:big_picture/constants/styles.dart';
import 'package:flutter/material.dart';

class FilterModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(size4),
          topRight: Radius.circular(size4),
        ),
      ),
      child: Text('tanha'),
    );
  }
}
