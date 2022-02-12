// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'workout_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutPart _$WorkoutPartFromJson(Map<String, dynamic> json) => $checkedCreate(
      'WorkoutPart',
      json,
      ($checkedConvert) {
        final val = WorkoutPart(
          id: $checkedConvert('id', (v) => v as int),
          exercise: $checkedConvert('exercise',
              (v) => SearchExercise.fromJson(v as Map<String, dynamic>)),
          weightUnit: $checkedConvert('weight_unit', (v) => v as int),
          sets: $checkedConvert(
              'sets',
              (v) => (v as List<dynamic>)
                  .map((e) => WorkoutSet.fromJson(e as Map<String, dynamic>))
                  .toList()),
          comment: $checkedConvert('comment', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'weightUnit': 'weight_unit'},
    );

Map<String, dynamic> _$WorkoutPartToJson(WorkoutPart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exercise': instance.exercise,
      'weight_unit': instance.weightUnit,
      'sets': instance.sets,
      'comment': instance.comment,
    };
