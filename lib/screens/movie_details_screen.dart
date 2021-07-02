import 'package:big_picture/widgets/watch_providers_section.dart';
import 'package:flutter/material.dart';

import '../constants/config.dart';
import '../constants/strings.dart';
import '../constants/styles.dart';
import '../models/movieDetails.dart';
import '../models/movieDetailsModel.dart';
import '../constants/content_type.dart';
import '../models/preview.dart';
import '../utilities/progressive_image.dart';
import '../utilities/scrollable_view_clipper.dart';
import '../utilities/utility.dart';
import '../widgets/bottom_circular_menu.dart';
import '../widgets/genre_label.dart';
import '../widgets/movies_detail_scroll_view.dart';
import '../widgets/ratings_section.dart';

import 'package:cached_network_image/cached_network_image.dart';

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
  double top = -374;

  @override
  void initState() {
    super.initState();
    movieDetails = MovieDetailsModel().getMovieDetails(
      tmdbID: widget.tmdbID,
      contentType: widget.contentType,
    );
  }

  Widget getAllGenre() {
    List genres = widget.genreString.split(', ');
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: genres
          .map(
            (genre) => GenreLabel(
              genreText: genre,
              bgColor: Colors.purpleAccent.shade100.withOpacity(0.7),
              textColor: Colors.purple.shade700,
            ),
          )
          .toList(),
    );
  }

  Widget getMovieScrollView({
    required Size size,
    required double offset,
    required Color color,
    required String sectionTitle,
    required List items,
  }) {
    top += 374;
    return Positioned(
      top: top,
      child: MoviesDetailScrollView(
        size: size,
        color: color,
        offset: offset,
        sectionTitle: sectionTitle,
        items: items,
      ),
    );
  }

  String displaySeasons(int totalSeasons) {
    if (totalSeasons == 1) {
      return '$totalSeasons season';
    } else if (totalSeasons == 0) {
      return hyphen;
    } else {
      return '$totalSeasons seasons';
    }
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
                        child: ClipRRect(
                          child: ProgressiveImage(
                            placeholder: AssetImage(
                              'assets/image.png',
                            ),
                            thumbnail: NetworkImage(
                              '$IMG_BASE_URL/$LOW_QUALITY/${widget.imageUrl}',
                            ),
                            image: CachedNetworkImageProvider(
                              '$IMG_BASE_URL/$HIGH_QUALITY/${widget.imageUrl}',
                            ),
                            width: posterWidth,
                            height: posterHeight,
                            fit: BoxFit.fitHeight,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: posterBLRadius,
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
                              controller: controller,
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
                                          top: 18,
                                          right: offset,
                                        ),
                                        child: Text(
                                          snapshot.data![0].title,
                                          style: movieDetailsTitle,
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      if (snapshot.data![1].tagline != '')
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: offset,
                                            top: 8,
                                            right: offset,
                                          ),
                                          child: Text(
                                            snapshot.data![1].tagline,
                                            style: movieDetailsTagline,
                                            softWrap: true,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      Divider(
                                        indent: offset,
                                        endIndent: offset,
                                        thickness: 1.0,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: offset,
                                          right: 24,
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 12,
                                                top: 8,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    snapshot.data![0].year ==
                                                            defaultDate
                                                        ? hyphen
                                                        : snapshot
                                                            .data![0].year,
                                                    style: movieDetailsData,
                                                  ),
                                                  Text(
                                                    '‧',
                                                    style:
                                                        movieDetailsDescription,
                                                  ),
                                                  Text(
                                                    widget.contentType ==
                                                            Type.movie
                                                        ? convertTime(
                                                            runtime: snapshot
                                                                .data![0]
                                                                .runtime)
                                                        : displaySeasons(
                                                            snapshot.data![0]
                                                                .totalSeasons),
                                                    style: movieDetailsData,
                                                  ),
                                                  Text(
                                                    '‧',
                                                    style:
                                                        movieDetailsDescription,
                                                  ),
                                                  Text(
                                                    getLanguageName(
                                                            key: snapshot
                                                                .data![1]
                                                                .originalLanguage)
                                                        .split(';')[0],
                                                    style: movieDetailsData,
                                                    softWrap: true,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            RatingsSection(
                                              ratings:
                                                  snapshot.data![0].ratings,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        indent: offset,
                                        endIndent: offset,
                                        thickness: 1.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: offset, top: 12, right: 24),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: getAllGenre(),
                                          /*  GenreLabel(
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
                                              ), */
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
                                      if (snapshot.data![0].status != '')
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: offset,
                                            top: 12,
                                            right: 24,
                                          ),
                                          child: Text(
                                            snapshot.data![0].status,
                                            style: movieDetailsDescription,
                                          ),
                                        ),
                                      WatchProvidersSection(
                                        watchProviders:
                                            snapshot.data![1].watchProviders,
                                      ),
                                      renderSections(
                                        size: size,
                                        offset: offset,
                                        movieDetails: snapshot.data![1],
                                      ),
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
                return Text('Connection could not be established');
            }
          },
        ),
      ),
    );
  }

  Widget renderSections(
      {required Size size,
      required double offset,
      required MovieDetails movieDetails}) {
    double sectionCount = 0;
    if (movieDetails.castList.isNotEmpty) {
      sectionCount++;
    }
    if (movieDetails.videos.isNotEmpty) {
      sectionCount++;
    }
    if (movieDetails.collectionParts.isNotEmpty) {
      sectionCount++;
    }
    if (movieDetails.recommendations.isNotEmpty) {
      sectionCount++;
    }

    return Container(
      height: 470 * sectionCount - (sectionCount - 1) * 96,
      child: Stack(
        children: [
          if (movieDetails.castList.isNotEmpty)
            getMovieScrollView(
              size: size,
              offset: offset,
              color: blueCustomViewColor,
              sectionTitle: castTitle,
              items: movieDetails.castList,
            ),
          if (movieDetails.videos.isNotEmpty)
            getMovieScrollView(
              size: size,
              offset: offset,
              color: redCustomViewColor,
              sectionTitle: videosTitle,
              items: movieDetails.videos,
            ),
          if (movieDetails.collectionParts.isNotEmpty)
            getMovieScrollView(
              size: size,
              offset: offset,
              color: blueCustomViewColor,
              sectionTitle: movieDetails.collectionName,
              items: movieDetails.collectionParts,
            ),
          if (movieDetails.recommendations.isNotEmpty)
            getMovieScrollView(
              size: size,
              offset: offset,
              color: greenCustomViewColor,
              sectionTitle: recommendationsTitle,
              items: movieDetails.recommendations,
            ),
        ],
      ),
    );
  }
}
