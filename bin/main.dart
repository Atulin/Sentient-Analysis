import 'package:AnomalyParser/Anomaly.dart';
import 'package:AnomalyParser/TimeHelper.dart';
import 'package:stats/stats.dart';

void main(List<String> arguments) async {
  var anomalies = await fetch();

  // Lists of uptimes and downtimes
  List<int> uptimes = [];
  List<int> downtimes = [];

  // Iterate over events
  var len = anomalies.length;
  for (var i = 1; i < len; i++) {
    var an1 = anomalies[i-1];
    var an2 = anomalies[i];

    // Calculate difference in seconds
    var t1   = DateTime.fromMillisecondsSinceEpoch(an1.time);
    var t2   = DateTime.fromMillisecondsSinceEpoch(an2.time);
    var diff = t1.difference(t2).inSeconds;

    // Append to the proper list
    if (diff > 1 * 60 * 60) {
      downtimes.add(diff);
    } else {
      uptimes.add(diff);
    }

    // Print the difference
    print(TimeStringFromSeconds(diff));
  }

  // Calculate stats
  var uptimeStats = Stats.fromData(uptimes);
  var downtimeStats = Stats.fromData(downtimes);

  print("Uptime statistics:");
  print("    Min: " + TimeStringFromSeconds(uptimeStats.min));
  print("    Max: " + TimeStringFromSeconds(uptimeStats.max));
  print("    Mean: " + TimeStringFromSeconds(uptimeStats.mean.round()));
  print("    Median: " + TimeStringFromSeconds(uptimeStats.median.round()));
  print("    Standard deviation: ${uptimeStats.standardDeviation.toStringAsFixed(3)} s");

  print("Downtime statistics:");
  print("    Min: " + TimeStringFromSeconds(downtimeStats.min));
  print("    Max: " + TimeStringFromSeconds(downtimeStats.max));
  print("    Mean: " + TimeStringFromSeconds(downtimeStats.mean.round()));
  print("    Median: " + TimeStringFromSeconds(downtimeStats.median.round()));
  print("    Standard deviation: ${downtimeStats.standardDeviation.toStringAsFixed(3)} s");

}
