import '../constants/config.dart';
import '../constants/strings.dart';
import '../constants/styles.dart';
import '../models/moviePreviewModel.dart';
import '../models/movieTilesModel.dart';
import '../models/preview.dart';
import '../screens/movie_details_screen.dart';
import '../utilities/utility.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoviePreview extends StatefulWidget {
  final int tmdbID;
  final String imageUrl;
  final String genreString;
  final contentType;

  MoviePreview({
    required this.tmdbID,
    required this.imageUrl,
    required this.genreString,
    required this.contentType,
  });

  @override
  _MoviePreviewState createState() => _MoviePreviewState();
}

class _MoviePreviewState extends State<MoviePreview> {
  late Future<Preview> preview;
  @override
  void initState() {
    super.initState();
    preview = MoviePreviewModel()
        .getPreview(tmdbID: widget.tmdbID, contentType: widget.contentType);
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
    return Container(
      height: 250,
      margin: EdgeInsets.all(size3),
      padding: EdgeInsets.only(
        top: size4,
        left: size4,
        right: size4,
        bottom: size5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(size4),
                        child: widget.imageUrl != ''
                            ? CachedNetworkImage(
                                imageUrl:
                                    '$IMG_BASE_URL/$HIGH_QUALITY/${widget.imageUrl}',
                                fit: BoxFit.cover,
                                placeholder: (ctx, url) => Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/image.png',
                                  ), //placeholder will be shown while image is loading
                                ),
                              )
                            : Image.asset('assets/image.png'),
                      ),
                      FutureBuilder<Preview>(
                        future: preview,
                        builder: (ctx, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.done:
                              if (snapshot.hasData &&
                                  snapshot.data!.ratings.isNotEmpty)
                                return Positioned(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(6),
                                      ),
                                      color: Colors.amber,
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: Text(
                                        snapshot.data!.ratings[0].value
                                            .split('/')[0],
                                      ),
                                    ),
                                  ),
                                  bottom: 10,
                                  right: 10,
                                );
                              else
                                return SizedBox();
                            default:
                              return SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: EdgeInsets.only(left: size3),
                    child: SizedBox(
                      height: 150,
                      child: FutureBuilder<Preview>(
                        future: preview,
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return Align(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(),
                              );
                            case ConnectionState.done:
                              if (snapshot.hasData) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.title,
                                      style: moviePreviewTitle,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Container(
                                      child: Text(
                                        '${snapshot.data!.year == defaultDate ? hyphen : snapshot.data!.year} ‧ ${widget.contentType == Type.MOVIE ? convertTime(runtime: snapshot.data!.runtime) : displaySeasons(snapshot.data!.totalSeasons)} ‧ ${widget.genreString}',
                                        style: moviePreviewSubTitle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                        snapshot.data!.plot == 'N/A'
                                            ? 'No description found'
                                            : snapshot.data!.plot,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: moviePreviewDescription,
                                        maxLines: 5,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                print(snapshot.error);
                                return Text(
                                    'Error: Please try again after some time');
                              }
                            default:
                              return Text('Connection failed');
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Divider(),
          // FutureBuilder<Preview>(
          //   future: preview,
          //   builder: (context, snapshot) {
          //     switch (snapshot.connectionState) {
          //       case ConnectionState.none:
          //       case ConnectionState.waiting:
          //         return Align(
          //           alignment: Alignment.center,
          //           child: CircularProgressIndicator(),
          //         );
          //       case ConnectionState.done:
          //         if (snapshot.hasData) {
          //           return Expanded(
          //             child: RatingsSection(
          //               scale: 1.25,
          //               ratings: snapshot.data!.ratings,
          //             ),
          //           );
          //         } else {
          //           return Text('Error ${snapshot.error}');
          //         }
          //       default:
          //         return Text('Connecton failed');
          //     }
          //   },
          // ),
          Divider(
            thickness: 1.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.bookmark_border_rounded,
                    size: size8,
                    color: Colors.red.shade600,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.verified_outlined,
                    size: size8,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.playlist_add,
                    size: size8,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.open_in_new_rounded,
                    size: size8,
                    color: Colors.purple,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(
                          contentType: widget.contentType,
                          imageUrl: widget.imageUrl,
                          tmdbID: widget.tmdbID,
                          genreString: widget.genreString,
                          preview: preview,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
