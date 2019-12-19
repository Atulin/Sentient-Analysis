// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Anomaly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anomaly _$AnomalyFromJson(Map<String, dynamic> json) {
  return Anomaly(
    time: json['time'] as int,
    result: json['result'] as String,
  );
}

Map<String, dynamic> _$AnomalyToJson(Anomaly instance) => <String, dynamic>{
      'time': instance.time,
      'result': instance.result,
    };
