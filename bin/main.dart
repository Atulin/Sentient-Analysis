import 'package:AnomalyParser/Anomaly.dart';
import 'package:AnomalyParser/TimeHelper.dart';

void main(List<String> arguments) async {
  var anomalies = await fetch();

  var len = anomalies.length;
  for (var i = 1; i < len; i++) {
    var an1 = anomalies[i-1];
    var an2 = anomalies[i];

    var t1 = DateTime.fromMillisecondsSinceEpoch(an1.time);
    var t2 = DateTime.fromMillisecondsSinceEpoch(an2.time);

    print(TimeStringFromSeconds(t1.difference(t2).inSeconds));
  }
}
