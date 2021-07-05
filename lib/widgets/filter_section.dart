import 'package:big_picture/constants/config.dart';
import 'package:big_picture/models/castTile.dart';
import 'package:big_picture/models/movieDetails.dart';

import '../models/searchModel.dart';
import '../constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class FilterSection extends StatefulWidget {
  @override
  _FilterSectionState createState() => _FilterSectionState();
}

enum YearChoice {
  year,
  range,
  def,
}

class _FilterSectionState extends State<FilterSection> {
  RangeValues _yearRangeSliderDiscreteValues = const RangeValues(1990, 2000);
  RangeValues _runtimeRangeSliderDiscreteValues = const RangeValues(0, 120);
  double _yearSliderDiscreteValue = 1990;
  YearChoice? yearChoiceValue = YearChoice.def;

  late SearchModel search;

  late TextEditingController actorController;
  late TextEditingController directorController;
  late TextEditingController genreController;
  late TextEditingController keywordController;
  late TextEditingController watchProviderController;

  late FocusNode actorFocusNode;
  late FocusNode directorFocusNode;
  late FocusNode genreFocusNode;
  late FocusNode keywordFocusNode;
  late FocusNode watchProviderFocusNode;

  void onRadioSelected(YearChoice? yearChoice) {
    setState(() {
      yearChoiceValue = yearChoice;
    });
  }

  @override
  void initState() {
    super.initState();

    search = SearchModel();

    actorController = TextEditingController();
    directorController = TextEditingController();
    genreController = TextEditingController();
    keywordController = TextEditingController();
    watchProviderController = TextEditingController();
    actorFocusNode = FocusNode();
    directorFocusNode = FocusNode();
    genreFocusNode = FocusNode();
    keywordFocusNode = FocusNode();
    watchProviderFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    actorController.dispose();
    directorController.dispose();
    genreController.dispose();
    keywordController.dispose();
    watchProviderController.dispose();

    actorFocusNode.dispose();
    directorFocusNode.dispose();
    genreFocusNode.dispose();
    keywordFocusNode.dispose();
    watchProviderFocusNode.dispose();

    super.dispose();
  }

  List<CastTile> actorChips = [];
  List<CastTile> directorChips = [];
  List<Genre> genreChips = [];
  List<Keyword> keywordChips = [];
  List<WatchProvider> watchProviderChips = [];

  List<CastTile> getActorChips() {
    return actorChips;
  }

  void addActorChips(CastTile actor) {
    setState(() {
      actorChips = [...actorChips, actor];
    });
  }

  List<CastTile> getDirectorChips() {
    return directorChips;
  }

  void addDirectorChips(CastTile director) {
    setState(() {
      directorChips = [...directorChips, director];
    });
  }

  List<Genre> getGenreChips() {
    return genreChips;
  }

  void addGenreChips(Genre genre) {
    setState(() {
      genreChips = [...genreChips, genre];
    });
  }

  List<Keyword> getKeywordChips() {
    return keywordChips;
  }

  void addKeywordChips(Keyword keyword) {
    setState(() {
      keywordChips = [...keywordChips, keyword];
    });
  }

  List<WatchProvider> getWatchProviderChips() {
    return watchProviderChips;
  }

  void addWatchProviderChips(WatchProvider watchProvider) {
    setState(() {
      watchProviderChips = [...watchProviderChips, watchProvider];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Wrap(
            children: getActorChips()
                .map((actor) => InputChip(
                      label: Text(actor.castName),
                      deleteIcon: Icon(Icons.close_rounded),
                      onDeleted: () {
                        setState(() {
                          actorChips = List.from(actorChips)
                            ..removeWhere(
                                (element) => element.castId == actor.castId);
                        });
                      },
                      avatar: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.network(
                            '$IMG_BASE_URL/$HIGH_QUALITY/${actor.imageUrl}'),
                      ),
                    ))
                .toList(),
          ),
        ),
        TypeAheadField(
          keepSuggestionsOnSuggestionSelected: true,
          textFieldConfiguration: TextFieldConfiguration(
            controller: actorController,
            focusNode: actorFocusNode,
            decoration: InputDecoration(
              labelText: 'Search Actors',
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6200EE)),
              ),
            ),
          ),
          suggestionsCallback: (pattern) async {
            return await search.getSearchResults(
                query: pattern, contentType: Type.people);
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text((suggestion as CastTile).castName),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: suggestion.imageUrl != ""
                    ? Image.network(
                        '$IMG_BASE_URL/$HIGH_QUALITY/${suggestion.imageUrl}',
                      )
                    : Image.asset('assets/image.png'),
              ),
            );
          },
          onSuggestionSelected: (suggestion) {
            addActorChips(suggestion as CastTile);
            actorController.clear();
            actorFocusNode.requestFocus();
          },
        ),
        Container(
          child: Wrap(
            children: getDirectorChips()
                .map(
                  (director) => InputChip(
                    label: Text(director.castName),
                    deleteIcon: Icon(Icons.close_rounded),
                    onDeleted: () {
                      setState(() {
                        directorChips = List.from(directorChips)
                          ..removeWhere(
                              (element) => element.castId == director.castId);
                      });
                    },
                    avatar: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                          '$IMG_BASE_URL/$HIGH_QUALITY/${director.imageUrl}'),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        TypeAheadField(
          keepSuggestionsOnSuggestionSelected: true,
          textFieldConfiguration: TextFieldConfiguration(
            controller: directorController,
            focusNode: directorFocusNode,
            decoration: InputDecoration(
              labelText: 'Search Directors',
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6200EE)),
              ),
            ),
          ),
          suggestionsCallback: (pattern) async {
            return await search.getSearchResults(
                query: pattern, contentType: Type.people);
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text((suggestion as CastTile).castName),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: suggestion.imageUrl != ""
                    ? Image.network(
                        '$IMG_BASE_URL/$HIGH_QUALITY/${suggestion.imageUrl}',
                      )
                    : Image.asset('assets/image.png'),
              ),
            );
          },
          onSuggestionSelected: (suggestion) {
            addDirectorChips(suggestion as CastTile);
            directorController.clear();
            directorFocusNode.requestFocus();
          },
        ),
        Container(
          child: Wrap(
            children: getGenreChips()
                .map(
                  (genre) => InputChip(
                    label: Text(genre.name),
                    deleteIcon: Icon(Icons.close_rounded),
                    onDeleted: () {
                      setState(() {
                        genreChips = List.from(genreChips)
                          ..removeWhere((element) => element.id == genre.id);
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ),
        TypeAheadField(
          keepSuggestionsOnSuggestionSelected: true,
          textFieldConfiguration: TextFieldConfiguration(
            controller: genreController,
            focusNode: genreFocusNode,
            decoration: InputDecoration(
              labelText: 'Search Genres',
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6200EE)),
              ),
            ),
          ),
          suggestionsCallback: (pattern) async {
            return search.getGenres(query: pattern);
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text((suggestion as Genre).name),
            );
          },
          onSuggestionSelected: (suggestion) {
            addGenreChips(suggestion as Genre);
            genreController.clear();
            genreFocusNode.requestFocus();
          },
        ),
        Container(
          child: Wrap(
            children: getKeywordChips()
                .map(
                  (keyword) => InputChip(
                    label: Text(keyword.name),
                    deleteIcon: Icon(Icons.close_rounded),
                    onDeleted: () {
                      setState(() {
                        keywordChips = List.from(keywordChips)
                          ..removeWhere((element) => element.id == keyword.id);
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ),
        TypeAheadField(
          keepSuggestionsOnSuggestionSelected: true,
          textFieldConfiguration: TextFieldConfiguration(
            controller: keywordController,
            focusNode: keywordFocusNode,
            decoration: InputDecoration(
              labelText: 'Search Keywords',
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6200EE)),
              ),
            ),
          ),
          suggestionsCallback: (pattern) async {
            return await search.getSearchResults(
                query: pattern, contentType: Type.keyword);
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text((suggestion as Keyword).name),
            );
          },
          onSuggestionSelected: (suggestion) {
            addKeywordChips(suggestion as Keyword);
            keywordController.clear();
            keywordFocusNode.requestFocus();
          },
        ),
        Container(
          child: Wrap(
            children: getWatchProviderChips()
                .map(
                  (watchProvider) => InputChip(
                    label: Text(watchProvider.name),
                    deleteIcon: Icon(Icons.close_rounded),
                    onDeleted: () {
                      setState(() {
                        watchProviderChips = List.from(watchProviderChips)
                          ..removeWhere(
                              (element) => element.id == watchProvider.id);
                      });
                    },
                    avatar: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                          '$IMG_BASE_URL/$HIGH_QUALITY/${watchProvider.logoPath}'),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        TypeAheadField(
          keepSuggestionsOnSuggestionSelected: true,
          textFieldConfiguration: TextFieldConfiguration(
            controller: watchProviderController,
            focusNode: watchProviderFocusNode,
            decoration: InputDecoration(
              labelText: 'Search Watch Providers',
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6200EE)),
              ),
            ),
          ),
          suggestionsCallback: (pattern) async {
            return await search.getSearchResults(
              query: pattern,
              contentType: Type.movie,
              isWatchProviders: true,
            );
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text((suggestion as WatchProvider).name),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: suggestion.logoPath != ""
                    ? Image.network(
                        '$IMG_BASE_URL/$HIGH_QUALITY/${suggestion.logoPath}',
                      )
                    : Image.asset('assets/image.png'),
              ),
            );
          },
          onSuggestionSelected: (suggestion) {
            addWatchProviderChips(suggestion as WatchProvider);
            watchProviderController.clear();
            watchProviderFocusNode.requestFocus();
          },
        ),
        Row(
          children: [
            Radio(
              value: YearChoice.year,
              toggleable: true,
              groupValue: yearChoiceValue,
              activeColor: Color(0xFF6200EE),
              onChanged: (YearChoice? yearChoice) =>
                  onRadioSelected(yearChoice),
            ),
            Text('Select year'),
            Expanded(
              child: Text(
                _yearSliderDiscreteValue.toInt().toString(),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        Slider(
          value: _yearSliderDiscreteValue,
          min: 1900,
          max: 2021,
          label: _yearSliderDiscreteValue.round().toString(),
          onChanged: yearChoiceValue != YearChoice.year
              ? null
              : (double value) {
                  setState(() {
                    _yearSliderDiscreteValue = value;
                  });
                },
        ),
        Text('OR'),
        Row(
          children: [
            Radio(
              value: YearChoice.range,
              toggleable: true,
              groupValue: yearChoiceValue,
              activeColor: Color(0xFF6200EE),
              onChanged: (YearChoice? yearChoice) =>
                  onRadioSelected(yearChoice),
            ),
            Text('Select year range'),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _yearRangeSliderDiscreteValues.start.toInt().toString(),
                  ),
                  Text('-'),
                  Text(
                    _yearRangeSliderDiscreteValues.end.toInt().toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
        RangeSlider(
          values: _yearRangeSliderDiscreteValues,
          min: 1900,
          max: 2021,
          labels: RangeLabels(
            _yearRangeSliderDiscreteValues.start.round().toString(),
            _yearRangeSliderDiscreteValues.end.round().toString(),
          ),
          onChanged: yearChoiceValue != YearChoice.range
              ? null
              : (RangeValues values) {
                  setState(() {
                    _yearRangeSliderDiscreteValues = values;
                  });
                },
        ),
        Row(
          children: [
            Text('Select runtime range'),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _runtimeRangeSliderDiscreteValues.start.toInt().toString(),
                  ),
                  Text('-'),
                  Text(
                    _runtimeRangeSliderDiscreteValues.end.toInt().toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
        RangeSlider(
          values: _runtimeRangeSliderDiscreteValues,
          min: 0,
          max: 240,
          labels: RangeLabels(
            _runtimeRangeSliderDiscreteValues.start.round().toString(),
            _runtimeRangeSliderDiscreteValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _runtimeRangeSliderDiscreteValues = values;
            });
          },
        ),
      ],
    );
  }
}
