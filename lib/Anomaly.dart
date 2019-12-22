// To parse this JSON data, do
//
//     final anomaly = anomalyFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'Anomaly.g.dart';

@JsonSerializable()
class Anomaly {
  final int time;
  final String result;

  Anomaly({this.time, this.result});

  factory Anomaly.fromJson(Map<String, dynamic> json) => _$AnomalyFromJson(json);

  Map<String, dynamic> toJson() => _$AnomalyToJson(this);
}

Future<List<Anomaly>> fetch() async {
  var url = 'http://155.138.228.215:4000/api/get/200';
  final res = await http.get(url, headers: {'Accept': 'aplication/json'});
  var jsonData = json.decode(res.body) as List;
  var anomalies = jsonData.map((m) => Anomaly.fromJson(m)).toList();
  return anomalies;
}
