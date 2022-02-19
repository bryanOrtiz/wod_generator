// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'workout_info_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutInfoSet _$WorkoutInfoSetFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WorkoutInfoSet',
      json,
      ($checkedConvert) {
        final val = WorkoutInfoSet(
          set: $checkedConvert(
              'obj', (v) => Set.fromJson(v as Map<String, dynamic>)),
          exercises: $checkedConvert(
              'exercise_list',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      WorkoutInfoExercise.fromJson(e as Map<String, dynamic>))
                  .toList()),
          isSuperset: $checkedConvert('is_superset', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {
        'set': 'obj',
        'exercises': 'exercise_list',
        'isSuperset': 'is_superset'
      },
    );

Map<String, dynamic> _$WorkoutInfoSetToJson(WorkoutInfoSet instance) =>
    <String, dynamic>{
      'obj': instance.set,
      'exercise_list': instance.exercises,
      'is_superset': instance.isSuperset,
    };
