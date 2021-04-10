import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/models/movieTilesModel.dart';
import 'package:big_picture/widgets/movies_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SearchBottomSheet();
  }
}

class SearchBottomSheet extends StatefulWidget {
  @override
  _SearchBottomSheetState createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  final List<MovieTile> movieTiles = MovieTilesModel().allMovieTiles;
  final PanelController panelController = PanelController();
  bool isPanelOpened = false;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      margin: EdgeInsets.all(size4),
      snapPoint: 0.5,
      maxHeight: 700,
      minHeight: 112,
      controller: panelController,
      // header:
      collapsed: Container(
        margin: EdgeInsets.only(
          left: size8,
          right: size8,
          top: size8,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 5,
                  child: TextFormField(
                    style: titleStyle,
                    textAlign: TextAlign.center,
                    autofocus: true,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: fontColorDark,
                        size: size6,
                      ),
                      fillColor: searchTextFieldColor,
                      hintText: searchText,
                      contentPadding: EdgeInsets.all(size3),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RotatedBox(
                    quarterTurns: 1,
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
            SizedBox(height: size7),
          ],
        ),
      ),
      onPanelSlide: (_) {
        if (panelController.isAttached && panelController.isPanelOpen) {
          setState(() {
            isPanelOpened = true;
          });
        } else {
          if (isPanelOpened) {
            setState(() {
              isPanelOpened = false;
            });
          }
        }
      },
      panel: Column(
        children: [
          isPanelOpened ? Text('Yes') : Text('No'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: size2 * size4),
              child: MoviesGridView(
                movieTiles: movieTiles,
              ),
            ),
          ),
        ],
      ),
    );
    // return DraggableScrollableSheet(
    //   expand: false,
    //   initialChildSize: 0.3,
    //   minChildSize: 0.2,
    //   maxChildSize: 0.9,
    //   builder: (context, controller) {
    //     return Padding(
    //       padding: EdgeInsets.only(
    //         left: size3,
    //         right: size3,
    //       ),
    //       child: Container(
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(size6),
    //             topRight: Radius.circular(size6),
    //           ),
    //         ),
    //         child: Column(
    //           children: [
    //             Padding(
    //               padding: EdgeInsets.all(size8),
    //               child: Row(
    //                 children: [
    //                   Flexible(
    //                     flex: 5,
    //                     child: TextFormField(
    //                       style: titleStyle,
    //                       textAlign: TextAlign.center,
    //                       autofocus: true,
    //                       textInputAction: TextInputAction.search,
    //                       decoration: InputDecoration(
    //                         prefixIcon: Icon(
    //                           Icons.search,
    //                           color: fontColorDark,
    //                           size: size6,
    //                         ),
    //                         fillColor: searchTextFieldColor,
    //                         hintText: searchText,
    //                         contentPadding: EdgeInsets.all(size3),
    //                       ),
    //                     ),
    //                   ),
    //                   Expanded(
    //                     flex: 1,
    //                     child: RotatedBox(
    //                       quarterTurns: 1,
    //                       child: IconButton(
    //                         icon: Icon(
    //                           Icons.tune_outlined,
    //                           color: fontColorDark,
    //                         ),
    //                         onPressed: () {},
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Expanded(
    //               child: MoviesGridView(
    //                 movieTiles: movieTiles,
    //                 controller: controller,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
