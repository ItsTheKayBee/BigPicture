import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/screens/movie_details_screen.dart';
import 'package:big_picture/screens/test.dart';
import 'package:flutter/material.dart';

class MoviePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size4),
                    child: Image.asset(
                      'assets/wonder.jpg',
                      height: 160,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: EdgeInsets.only(left: size3),
                    child: SizedBox(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Wonder Woman and the wasp and the wasp',
                            style: moviePreviewTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Container(
                            child: Text(
                              '2020 ‧ 2h 31m ‧ Action, Adventure',
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
                              "Diana Prince lives quietly Diana Prince lives quietly among mortals in the vibrant, sleek 1980s -- an era of excess driven by the pursuit of having it all.",
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: moviePreviewDescription,
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.25,
                        child: Image.asset(
                          'assets/imdb.png',
                        ),
                      ),
                      SizedBox(
                        width: size3,
                      ),
                      Text(
                        '8.5',
                        style: moviePreviewRatings,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/tomato.png',
                        height: 25,
                      ),
                      SizedBox(
                        width: size3,
                      ),
                      Text(
                        '85%',
                        style: moviePreviewRatings,
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(size1),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: size2),
                  child: Center(
                    child: Text(
                      '89',
                      style: moviePreviewMetacritic,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
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
                        builder: (context) => MovieDetailsScreen(),
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
