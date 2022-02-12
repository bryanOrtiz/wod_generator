// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'workout_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutSet _$WorkoutSetFromJson(Map<String, dynamic> json) => $checkedCreate(
      'WorkoutSet',
      json,
      ($checkedConvert) {
        final val = WorkoutSet(
          reps: $checkedConvert('reps', (v) => v as int),
        );
        return val;
      },
    );

Map<String, dynamic> _$WorkoutSetToJson(WorkoutSet instance) =>
    <String, dynamic>{
      'reps': instance.reps,
    };
