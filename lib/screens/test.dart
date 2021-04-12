import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Container(
        height: size.height,
        color: Colors.amber,
        child: DraggableScrollableSheet(
          minChildSize: 1,
          initialChildSize: 1,
          maxChildSize: 1,
          builder: (ctx, cont) {
            return Container(
              child: SingleChildScrollView(
                controller: cont,
                child: ClipPath(
                  clipper: MyCustomClipper(testSize: size),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        width: size.width,
                        color: Colors.green,
                      ),
                      Container(
                        height: 300,
                        width: size.width,
                        color: Colors.red,
                      ),
                      Container(
                        height: 300,
                        width: size.width,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 300,
                        width: size.width,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  Size testSize;

  MyCustomClipper({this.testSize});

  @override
  Path getClip(Size size) {
    print(testSize.width);
    return Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, testSize.height * 0.75)
      ..lineTo(size.width * 0.1 + 48, testSize.height * 0.75)
      ..quadraticBezierTo(
        size.width * 0.1 + 4,
        testSize.height * 0.75,
        size.width * 0.1,
        testSize.height * 0.75 - 48,
      )
      ..lineTo(size.width * 0.1, testSize.height * 0.75 - 48)
      ..lineTo(size.width * 0.1, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
