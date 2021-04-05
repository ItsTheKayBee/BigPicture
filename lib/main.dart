import 'package:flutter/material.dart';

import './constants/styles.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Big Picture',
      theme: ThemeData(
        //colors
        accentColor: Color(0xff70bba3),
        primaryColor: Color(0xff9ce6dc),

        //font
        fontFamily: 'Poppins',
      ),
      home: SafeArea(
        child: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<MovieTile> data = [
      MovieTile(
        selected: false,
      ),
      MovieTile(
        selected: false,
      ),
      MovieTile(
        selected: false,
      ),
      MovieTile(
        selected: false,
      ),
    ];
    int _focusedIndex = 0;

    var _gradientBackdrop = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Theme.of(context).primaryColor,
          Color(0xffbce0dc),
          Colors.white,
        ],
      ),
    );

    void _onItemFocus(int index) {
      setState(() {
        _focusedIndex = index;
        data[index].selected = true;
      });
    }

    Widget _buildListItem(BuildContext context, int index) {
      //horizontal
      return MovieTile();
    }

    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 16.0,
                      ),
                      child: Text(
                        "New Movies",
                        style: headingFont,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    height: 300.0,
                    child: ScrollSnapList(
                      onItemFocus: _onItemFocus,
                      itemSize: 180,
                      itemBuilder: _buildListItem,
                      itemCount: data.length,
                      dynamicItemSize: true,
                      dynamicItemOpacity: 0.8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: _gradientBackdrop,
      ),
    );
  }
}

class MovieTile extends StatelessWidget {
  var selected;

  MovieTile({this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Expanded(
                child: Image.asset(
                  'assets/wonder.jpg',
                  fit: BoxFit.fill,
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Text(
              "Wonder woman",
              style: movieFont,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Text(
              "Action, Sci-Fi",
              style: genreFont,
            ),
          ),
        ],
      ),
    );
  }
}
