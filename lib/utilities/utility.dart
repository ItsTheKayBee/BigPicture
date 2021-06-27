convertTime(String runtime) {
  if (runtime == 'N/A') {
    return '-';
  }
  int duration = int.parse(runtime.split(' ')[0]);
  String convertedTime = '';
  if (duration >= 60) {
    int hours = (duration / 60).floor();
    duration %= 60;
    convertedTime = '${hours}h';
  }
  if (duration < 60) {
    convertedTime += ' ${duration}m';
  }

  return convertedTime.trim();
}
