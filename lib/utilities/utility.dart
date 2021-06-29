import 'package:big_picture/constants/language.dart';
import 'package:big_picture/constants/strings.dart';

String convertTime({required int runtime}) {
  if (runtime == 0) {
    return '-';
  }
  String convertedTime = '';
  if (runtime >= 60) {
    int hours = (runtime / 60).floor();
    runtime %= 60;
    convertedTime = '${hours}h';
  }
  if (runtime < 60 && runtime != 0) {
    convertedTime += ' ${runtime}m';
  }

  return convertedTime.trim();
}

String getLanguageName({required String key}) =>
    isoLangs[key]?['name'] ?? hyphen;
