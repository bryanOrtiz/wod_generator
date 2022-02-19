// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'workout_info_day_of_week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutInfoDayOfWeek _$WorkoutInfoDayOfWeekFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'WorkoutInfoDayOfWeek',
      json,
      ($checkedConvert) {
        final val = WorkoutInfoDayOfWeek(
          day: $checkedConvert('text', (v) => v as String),
          days: $checkedConvert(
              'day_list',
              (v) => (v as List<dynamic>)
                  .map((e) => DaysOfTheWeek.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'day': 'text', 'days': 'day_list'},
    );

Map<String, dynamic> _$WorkoutInfoDayOfWeekToJson(
        WorkoutInfoDayOfWeek instance) =>
    <String, dynamic>{
      'text': instance.day,
      'day_list': instance.days,
    };
