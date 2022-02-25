// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Day',
      json,
      ($checkedConvert) {
        final val = Day(
          id: $checkedConvert('id', (v) => v as int?),
          training: $checkedConvert('training', (v) => v as int),
          description: $checkedConvert('description', (v) => v as String),
          day: $checkedConvert(
              'day', (v) => (v as List<dynamic>).map((e) => e as int).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$DayToJson(Day instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['training'] = instance.training;
  val['description'] = instance.description;
  val['day'] = instance.day;
  return val;
}
