// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'days_of_the_week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DaysOfTheWeek _$DaysOfTheWeekFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DaysOfTheWeek',
      json,
      ($checkedConvert) {
        final val = DaysOfTheWeek(
          id: $checkedConvert('id', (v) => v as int),
          day: $checkedConvert('day_of_week', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'day': 'day_of_week'},
    );

Map<String, dynamic> _$DaysOfTheWeekToJson(DaysOfTheWeek instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day_of_week': instance.day,
    };
