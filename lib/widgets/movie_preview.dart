import 'package:big_picture/constants/styles.dart';
import 'package:flutter/material.dart';

class MoviePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.all(size3),
      padding: EdgeInsets.all(size4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size4),
                    child: Image.asset(
                      'assets/wonder.jpg',
                      height: 150,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: EdgeInsets.only(left: size3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Wonder Woman',
                          style: titleStyle,
                        ),
                        Text(
                          '2020 ‧ 2h 31m',
                          style: subTitleStyle,
                        ),
                        Text(
                          'Action/Adventure',
                          style: subTitleStyle,
                        ),
                        Text(
                          "Diana Prince lives quietly Diana Prince lives quietly among mortals in the vibrant, sleek 1980s -- an era of excess driven by the pursuit of having it all.",
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: subTitleStyle,
                          maxLines: 4,
                        ),
                      ],
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
                Container(
                  child: Row(
                    children: [Icon(Icons.star), Text('8.5')],
                  ),
                ),
                Container(
                  child: Row(
                    children: [Icon(Icons.star), Text('85%')],
                  ),
                ),
                Container(
                  child: Row(
                    children: [Icon(Icons.star), Text('89%')],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.bookmark_border_rounded, size: size8),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.verified_outlined, size: size8),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.open_in_new_rounded, size: size8),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
