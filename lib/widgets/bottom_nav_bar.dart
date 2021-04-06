
import 'package:big_picture/constants/styles.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: cardElevation,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.only(bottom: size2),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: size8),
                  child: IconButton(
                    icon: Icon(Icons.home_outlined),
                    onPressed: () {},
                    color: fontColorLight,
                    iconSize: size8,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: size2),
                  child: IconButton(
                    icon: Icon(Icons.bookmark_outline),
                    onPressed: () {},
                    color: fontColorLight,
                    iconSize: size8,
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: size2),
                  child: IconButton(
                    icon: Icon(Icons.check_circle_outline),
                    onPressed: () {},
                    color: fontColorLight,
                    iconSize: size8,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: size8),
                  child: IconButton(
                    icon: Icon(Icons.person_outline),
                    onPressed: () {},
                    color: fontColorLight,
                    iconSize: size8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        foregroundColor: Colors.white,
        onPressed: () {},
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
    );
  }
}
