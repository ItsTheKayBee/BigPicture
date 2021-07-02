import '../constants/language.dart';
import '../constants/strings.dart';
import 'package:country_codes/country_codes.dart';

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

// this function return ISO code of country (US, IN, etc)
Future getIsoCode() async {
  await CountryCodes.init();

  return CountryCodes.detailsForLocale().alpha2Code;
}
