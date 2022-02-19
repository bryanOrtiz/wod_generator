// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'workout_info_muscle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutInfoMuscle _$WorkoutInfoMuscleFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WorkoutInfoMuscle',
      json,
      ($checkedConvert) {
        final val = WorkoutInfoMuscle(
          frontMuscles: $checkedConvert(
              'front',
              (v) => (v as List<dynamic>)
                  .map((e) => Muscle.fromJson(e as Map<String, dynamic>))
                  .toList()),
          backMuscles: $checkedConvert(
              'back',
              (v) => (v as List<dynamic>)
                  .map((e) => Muscle.fromJson(e as Map<String, dynamic>))
                  .toList()),
          frontSecondaryMuscles: $checkedConvert(
              'frontsecondary',
              (v) => (v as List<dynamic>)
                  .map((e) => Muscle.fromJson(e as Map<String, dynamic>))
                  .toList()),
          backSecondaryMuscles: $checkedConvert(
              'backsecondary',
              (v) => (v as List<dynamic>)
                  .map((e) => Muscle.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'frontMuscles': 'front',
        'backMuscles': 'back',
        'frontSecondaryMuscles': 'frontsecondary',
        'backSecondaryMuscles': 'backsecondary'
      },
    );

Map<String, dynamic> _$WorkoutInfoMuscleToJson(WorkoutInfoMuscle instance) =>
    <String, dynamic>{
      'front': instance.frontMuscles,
      'back': instance.backMuscles,
      'frontsecondary': instance.frontSecondaryMuscles,
      'backsecondary': instance.backSecondaryMuscles,
    };
