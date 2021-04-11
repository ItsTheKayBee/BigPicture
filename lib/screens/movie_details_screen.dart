import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/widgets/bottom_circular_menu.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double posterWidth = size.width * 0.9;
    double posterHeight = size.height * 0.7;
    double offset = size.width * 0.1;
    Radius buttonRadius = Radius.circular(48);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 24),
              child: Column(
                children: [
                  Container(
                    height: posterHeight,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          width: posterWidth,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/wonder.jpg'),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.center,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: buttonRadius,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: offset, top: 24, right: 24),
                    child: Text(
                      'Wonder Woman and the wasp of the golden age',
                      style: movieDetailsTitle,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: offset, top: 12, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '12.04.2021',
                          style: movieDetailsData,
                        ),
                        Text(
                          '‧',
                          style: movieDetailsSubTitle,
                        ),
                        Text(
                          '2h 31m',
                          style: movieDetailsData,
                        ),
                        Text(
                          '‧',
                          style: movieDetailsSubTitle,
                        ),
                        Text(
                          'English',
                          style: movieDetailsData,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: offset, top: 12, right: 24),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          GenreLabel(
                            genreText: 'Action',
                            bgColor:
                                Colors.amberAccent.shade100.withOpacity(0.7),
                            textColor: Colors.amber.shade700,
                          ),
                          GenreLabel(
                            genreText: 'Adventure',
                            bgColor:
                                Colors.purpleAccent.shade100.withOpacity(0.7),
                            textColor: Colors.purple.shade700,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              left: offset - 24,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            BottomCircularMenu(),
          ],
        ),
      ),
    );
  }
}

class GenreLabel extends StatelessWidget {
  final String genreText;
  final Color bgColor;
  final Color textColor;

  const GenreLabel({
    @required this.genreText,
    @required this.bgColor,
    @required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: bgColor,
      ),
      child: Text(
        '$genreText',
        style: TextStyle(color: textColor),
      ),
    );
  }
}
