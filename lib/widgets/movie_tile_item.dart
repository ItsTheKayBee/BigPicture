import 'package:big_picture/constants/config.dart';
import 'package:big_picture/utilities/progressive_image.dart';
import 'package:big_picture/widgets/movie_preview.dart';
import 'package:flutter/material.dart';

import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieTileItem extends StatelessWidget {
  // condition to check whether current card is the focussed card
  final MovieTile movieTile;

  MovieTileItem({
    required this.movieTile, // data model
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return MoviePreview(
              tmdbID: movieTile.movieId,
              imageUrl: movieTile.imageUrl,
            );
          },
        );
      },
      child: Container(
        width: size.width * 0.6,
        padding: EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shadowColor: primaryColor,
              child: movieTile.imageUrl != ''
                  ? ProgressiveImage(
                      placeholder: AssetImage(
                        'assets/image.png',
                      ),
                      thumbnail: NetworkImage(
                        '$IMG_BASE_URL/$LOW_QUALITY/${movieTile.imageUrl}',
                      ),
                      image: CachedNetworkImageProvider(
                        '$IMG_BASE_URL/$HIGH_QUALITY/${movieTile.imageUrl}',
                      ),
                      width: size.width * 0.6,
                      height: 340,
                    )
                  : Image.asset('assets/image.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: size1),
              child: Text(
                movieTile.movieName,
                style: titleStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size1),
              child: Text(
                '${movieTile.voteAverage}/10',
                style: subTitleStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
