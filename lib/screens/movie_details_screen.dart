import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieDetails.dart';
import 'package:big_picture/models/movieDetailsModel.dart';
import 'package:big_picture/models/preview.dart';
import 'package:big_picture/utilities/scrollable_view_clipper.dart';
import 'package:big_picture/widgets/bottom_circular_menu.dart';
import 'package:big_picture/widgets/genre_label.dart';
import 'package:big_picture/widgets/movies_detail_scroll_view.dart';
import 'package:big_picture/widgets/ratings_section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int tmdbID;
  final String imageUrl;
  final String genreString;
  final contentType;
  final Future<Preview> preview;

  MovieDetailsScreen({
    required this.tmdbID,
    required this.imageUrl,
    required this.genreString,
    required this.contentType,
    required this.preview,
  });

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late Future<MovieDetails> movieDetails;

  @override
  void initState() {
    super.initState();
    movieDetails = MovieDetailsModel().getMovieDetails(
      tmdbID: widget.tmdbID,
      contentType: widget.contentType,
    );
  }

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
        child: FutureBuilder<List<dynamic>>(
          future: Future.wait([widget.preview, movieDetails]),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return Stack(
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
                                          snapshot.data![0].title,
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 12, top: 12, right: 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    snapshot.data![0].year,
                                                    style: movieDetailsData,
                                                  ),
                                                  Text(
                                                    '‧',
                                                    style:
                                                        movieDetailsDescription,
                                                  ),
                                                  Text(
                                                    snapshot.data![0].runtime,
                                                    style: movieDetailsData,
                                                  ),
                                                  Text(
                                                    '‧',
                                                    style:
                                                        movieDetailsDescription,
                                                  ),
                                                  Text(
                                                    snapshot.data![1]
                                                        .originalLanguage,
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
                                                bgColor: Colors
                                                    .amberAccent.shade100
                                                    .withOpacity(0.7),
                                                textColor:
                                                    Colors.amber.shade700,
                                              ),
                                              GenreLabel(
                                                genreText: 'Adventure',
                                                bgColor: Colors
                                                    .purpleAccent.shade100
                                                    .withOpacity(0.7),
                                                textColor:
                                                    Colors.purple.shade700,
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
                                          snapshot.data![1].overview,
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
                                              castTiles: [],
                                            ),
                                            Positioned(
                                              top: 374,
                                              child: MoviesDetailScrollView(
                                                size: size,
                                                color: redCustomViewColor,
                                                offset: offset,
                                                sectionTitle: 'Videos',
                                                castTiles: [],
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
                  );
                } else {
                  return Text('No $snapshot.error');
                }
              default:
                return Text('default');
            }
          },
        ),
      ),
    );
  }
}
