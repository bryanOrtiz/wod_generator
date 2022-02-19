// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'workout_info_exercise_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutInfoExerciseImage _$WorkoutInfoExerciseImageFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'WorkoutInfoExerciseImage',
      json,
      ($checkedConvert) {
        final val = WorkoutInfoExerciseImage(
          image: $checkedConvert('image', (v) => v as String),
          isMain: $checkedConvert('is_main', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isMain': 'is_main'},
    );

Map<String, dynamic> _$WorkoutInfoExerciseImageToJson(
        WorkoutInfoExerciseImage instance) =>
    <String, dynamic>{
      'image': instance.image,
      'is_main': instance.isMain,
    };
