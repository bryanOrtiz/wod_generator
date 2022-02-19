// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'workout_info_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutInfoDay _$WorkoutInfoDayFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WorkoutInfoDay',
      json,
      ($checkedConvert) {
        final val = WorkoutInfoDay(
          day: $checkedConvert(
              'obj', (v) => Day.fromJson(v as Map<String, dynamic>)),
          daysOfTheWeek: $checkedConvert('days_of_week',
              (v) => WorkoutInfoDayOfWeek.fromJson(v as Map<String, dynamic>)),
          sets: $checkedConvert(
              'set_list',
              (v) => (v as List<dynamic>)
                  .map(
                      (e) => WorkoutInfoSet.fromJson(e as Map<String, dynamic>))
                  .toList()),
          muscles: $checkedConvert('muscles',
              (v) => WorkoutInfoMuscle.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'day': 'obj',
        'daysOfTheWeek': 'days_of_week',
        'sets': 'set_list'
      },
    );

Map<String, dynamic> _$WorkoutInfoDayToJson(WorkoutInfoDay instance) =>
    <String, dynamic>{
      'obj': instance.day,
      'days_of_week': instance.daysOfTheWeek,
      'set_list': instance.sets,
      'muscles': instance.muscles,
    };
