import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/castTile.dart';
import 'package:big_picture/utilities/scrollable_view_clipper.dart';
import 'package:big_picture/widgets/bottom_circular_menu.dart';
import 'package:big_picture/widgets/genre_label.dart';
import 'package:big_picture/widgets/movies_detail_scroll_view.dart';
import 'package:big_picture/widgets/ratings_section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  final List<CastTile> movieTiles = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double heightPercentage = 0.7;
    const double widthPercentage = 0.9;
    const double radialOffset = 48;
    final double posterWidth = size.width * widthPercentage;
    final double posterHeight = size.height * heightPercentage;
    final double offset = size.width * (1 - widthPercentage);
    final Radius posterBLRadius = Radius.circular(radialOffset);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Container(
                width: posterWidth,
                height: posterHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/wonder.jpg'),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: posterBLRadius,
                  ),
                ),
              ),
            ),
            DraggableScrollableSheet(
              minChildSize: 1,
              initialChildSize: 1,
              maxChildSize: 1,
              builder: (context, controller) {
                return Container(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 32),
                    controller: controller,
                    dragStartBehavior: DragStartBehavior.down,
                    physics: BouncingScrollPhysics(),
                    child: ClipPath(
                      clipper: ScrollableViewClipper(
                        parentHeight: size.height,
                        heightPercentage: heightPercentage,
                        widthPercentage: 1 - widthPercentage,
                        radialOffset: radialOffset,
                      ),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              height: posterHeight,
                              width: size.width,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: offset,
                                top: 24,
                                right: 24,
                              ),
                              child: Text(
                                'Wonder Woman and the wasp of the golden age',
                                style: movieDetailsTitle,
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: offset,
                                right: 24,
                                top: 12,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 12, top: 12, right: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '12.04.2021',
                                          style: movieDetailsData,
                                        ),
                                        Text(
                                          '‧',
                                          style: movieDetailsDescription,
                                        ),
                                        Text(
                                          '2h 31m',
                                          style: movieDetailsData,
                                        ),
                                        Text(
                                          '‧',
                                          style: movieDetailsDescription,
                                        ),
                                        Text(
                                          'English',
                                          style: movieDetailsData,
                                        ),
                                      ],
                                    ),
                                  ),
                                  RatingsSection(
                                    ratings: [],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: offset, top: 12, right: 24),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    GenreLabel(
                                      genreText: 'Action',
                                      bgColor: Colors.amberAccent.shade100
                                          .withOpacity(0.7),
                                      textColor: Colors.amber.shade700,
                                    ),
                                    GenreLabel(
                                      genreText: 'Adventure',
                                      bgColor: Colors.purpleAccent.shade100
                                          .withOpacity(0.7),
                                      textColor: Colors.purple.shade700,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: offset,
                                top: 12,
                                right: 24,
                              ),
                              child: Text(
                                'Lorem ipsum ipsum unceuiwniur fucrwiufnw weiunewufnew weiucnweuincw enciweu ceunew ceunceu cuewnue ceuecnuenc uecneunc ecue euec cnec ceuce cuecne ceu',
                                style: movieDetailsDescription,
                              ),
                            ),
                            Container(
                              height: 900,
                              child: Stack(
                                children: [
                                  MoviesDetailScrollView(
                                    size: size,
                                    color: blueCustomViewColor,
                                    offset: offset,
                                    sectionTitle: 'Cast',
                                    castTiles: movieTiles,
                                  ),
                                  Positioned(
                                    top: 374,
                                    child: MoviesDetailScrollView(
                                      size: size,
                                      offset: offset,
                                      castTiles: movieTiles,
                                      sectionTitle: 'Videos',
                                      color: redCustomViewColor,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              top: 50,
              left: offset - 24,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
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
