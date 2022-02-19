// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'workout_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutInfo _$WorkoutInfoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'WorkoutInfo',
      json,
      ($checkedConvert) {
        final val = WorkoutInfo(
          workout: $checkedConvert(
              'obj', (v) => Workout.fromJson(v as Map<String, dynamic>)),
          days: $checkedConvert(
              'day_list',
              (v) => (v as List<dynamic>)
                  .map(
                      (e) => WorkoutInfoDay.fromJson(e as Map<String, dynamic>))
                  .toList()),
          muscles: $checkedConvert('muscles',
              (v) => WorkoutInfoMuscle.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'workout': 'obj', 'days': 'day_list'},
    );

Map<String, dynamic> _$WorkoutInfoToJson(WorkoutInfo instance) =>
    <String, dynamic>{
      'obj': instance.workout,
      'day_list': instance.days,
      'muscles': instance.muscles,
    };
