import 'package:big_picture/constants/config.dart';
import 'package:big_picture/models/castTile.dart';
import 'package:big_picture/models/movieTilesModel.dart';
import 'package:big_picture/utilities/progressive_image.dart';
import 'package:flutter/material.dart';

import 'package:big_picture/constants/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CastTileItem extends StatelessWidget {
  // condition to check whether current card is the focussed card
  final CastTile castTile;
  final MovieTilesModel movieTilesModel = MovieTilesModel();

  final double posterWidth;
  final double posterHeight;

  CastTileItem({
    required this.castTile, // data model
    required this.posterWidth,
    required this.posterHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: posterWidth,
        padding: EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shadowColor: primaryColor,
              child: castTile.imageUrl != ''
                  ? ProgressiveImage(
                      placeholder: AssetImage(
                        'assets/image.png',
                      ),
                      thumbnail: NetworkImage(
                        '$IMG_BASE_URL/$LOW_QUALITY/${castTile.imageUrl}',
                      ),
                      image: CachedNetworkImageProvider(
                        '$IMG_BASE_URL/$HIGH_QUALITY/${castTile.imageUrl}',
                      ),
                      width: posterWidth,
                      height: posterHeight)
                  : Image.asset('assets/image.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: size1),
              child: Text(
                castTile.castName,
                style: titleStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size1),
              child: Text(
                castTile.castRoleName,
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
