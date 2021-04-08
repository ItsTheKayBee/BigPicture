import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/models/movieTilesModel.dart';
import 'package:big_picture/widgets/movie_tile_item.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class WatchListScreen extends StatelessWidget {
  final List<MovieTile> movieTiles = MovieTilesModel().allMovieTiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: size8 + size2,
              left: size8,
              right: size8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.favorite_rounded,
                  size: size2 * 7,
                  color: Colors.white38,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size4,
                    bottom: size4,
                  ),
                  child: Text(
                    watchListTitle,
                    style: headingStyle,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: TextFormField(
                        style: titleStyle,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: fontColorDark,
                            size: size6,
                          ),
                          hintText: searchText,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Transform.rotate(
                        angle: pi / 2, // rotate icon
                        child: IconButton(
                          icon: Icon(
                            Icons.tune_outlined,
                            color: fontColorDark,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: size4,
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(
                left: size8,
                right: size8,
                bottom: size8 + size2,
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.55,
                crossAxisSpacing: size4,
                mainAxisSpacing: size2,
              ),
              itemBuilder: (context, index) => Expanded(
                child: movieTileItem(
                  movieTile: movieTiles[index],
                ),
              ),
              itemCount: movieTiles.length,
            ),
          ),
        ],
      ),
    );
  }
}
