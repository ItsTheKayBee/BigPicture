import '../widgets/filter_section.dart';
import 'package:flutter/material.dart';
import '../constants/styles.dart';
import '../constants/strings.dart';

class FilterModal extends StatelessWidget {
  final Type contentType;
  FilterModal({required this.contentType});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (contentType == Type.movie) {
      return Container(
        height: size.height * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size4),
            topRight: Radius.circular(size4),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: FilterSection(),
              ),
            ),
          ],
        ),
      );
    } else if (contentType == Type.tv) {
      return Container(
        height: size.height * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size4),
            topRight: Radius.circular(size4),
          ),
        ),
        child: Text('TV'),
      );
    } else {
      return Text('Filters exist only for movies and TV series');
    }
  }
}
