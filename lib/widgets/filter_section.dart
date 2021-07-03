import 'package:big_picture/models/castTile.dart';

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

  void onRadioSelected(YearChoice? yearChoice) {
    setState(() {
      yearChoiceValue = yearChoice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
        TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
              decoration: InputDecoration(border: OutlineInputBorder())),
          suggestionsCallback: (pattern) async {
            return await SearchModel()
                .getSearchResults(query: pattern, contentType: Type.people);
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text((suggestion as CastTile).castName),
              subtitle: Text(suggestion.castId.toString()),
            );
          },
          onSuggestionSelected: (suggestion) {
            //TODO: implement chips
          },
        ),
      ],
    );
  }
}
