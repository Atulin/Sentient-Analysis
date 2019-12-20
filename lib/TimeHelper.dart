String HoursMinutesSecondsFromSeconds(int seconds) {
  var dur = Duration(seconds: seconds);

  var h = dur.inHours.toString().padLeft(2, '0');
  var m = dur.inMinutes.remainder(60).toString().padLeft(2, '0');
  var s = dur.inSeconds.remainder(60).toString().padLeft(2, '0');

  return '${h}:${m}:${s}';
}
