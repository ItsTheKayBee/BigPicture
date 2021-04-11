import 'package:flutter/material.dart';
import 'dart:math';
import 'circular_button.dart';

class BottomCircularMenu extends StatefulWidget {
  @override
  _BottomCircularMenuState createState() => _BottomCircularMenuState();
}

class _BottomCircularMenuState extends State<BottomCircularMenu>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;

  Animation rotationAnimation;
  bool isFabCLicked = false;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    degOneTranslationAnimation = TweenSequence(<TweenSequenceItem>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.0, end: 1.2),
        weight: 75.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.2, end: 1.0),
        weight: 25.0,
      ),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence(<TweenSequenceItem>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.0, end: 1.4),
        weight: 55.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.4, end: 1.0),
        weight: 45.0,
      )
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence(<TweenSequenceItem>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.0, end: 1.75),
        weight: 35.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.75, end: 1.0),
        weight: 65.0,
      )
    ]).animate(animationController);

    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 30,
      bottom: 30,
      child: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset.fromDirection(
              getRadiansFromDegree(270),
              degOneTranslationAnimation.value * 100,
            ),
            child: Transform(
              transform: Matrix4.rotationZ(
                getRadiansFromDegree(rotationAnimation.value),
              )..scale(degOneTranslationAnimation.value),
              alignment: Alignment.center,
              child: CircularButton(
                color: Colors.black,
                width: 50,
                height: 50,
                icon: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset.fromDirection(
              getRadiansFromDegree(225),
              degTwoTranslationAnimation.value * 100,
            ),
            child: Transform(
              transform: Matrix4.rotationZ(
                getRadiansFromDegree(rotationAnimation.value),
              )..scale(degTwoTranslationAnimation.value),
              alignment: Alignment.center,
              child: CircularButton(
                color: Colors.black,
                width: 50,
                height: 50,
                icon: Icon(
                  Icons.playlist_add_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset.fromDirection(
              getRadiansFromDegree(180),
              degThreeTranslationAnimation.value * 100,
            ),
            child: Transform(
              transform: Matrix4.rotationZ(
                getRadiansFromDegree(rotationAnimation.value),
              )..scale(degThreeTranslationAnimation.value),
              alignment: Alignment.center,
              child: CircularButton(
                color: Colors.black,
                width: 50,
                height: 50,
                icon: Icon(
                  Icons.bookmark_border_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Transform(
            transform: Matrix4.rotationZ(
              getRadiansFromDegree(rotationAnimation.value),
            ),
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: isFabCLicked ? 0 : pi / 4,
              child: CircularButton(
                color: Colors.black,
                width: 60,
                height: 60,
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                ),
                onClick: () {
                  setState(() {
                    isFabCLicked = !isFabCLicked;
                  });
                  if (animationController.isCompleted) {
                    animationController.reverse();
                  } else {
                    animationController.forward();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
