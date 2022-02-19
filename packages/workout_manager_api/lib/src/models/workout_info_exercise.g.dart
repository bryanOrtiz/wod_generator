// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'workout_info_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutInfoExercise _$WorkoutInfoExerciseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WorkoutInfoExercise',
      json,
      ($checkedConvert) {
        final val = WorkoutInfoExercise(
          exercise: $checkedConvert(
              'obj', (v) => Exercise.fromJson(v as Map<String, dynamic>)),
          text: $checkedConvert('setting_text', (v) => v as String),
          hasWeight: $checkedConvert('has_weight', (v) => v as bool),
          comments: $checkedConvert('comment_list',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          images: $checkedConvert(
              'image_list',
              (v) => (v as List<dynamic>)
                  .map((e) => WorkoutInfoExerciseImage.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          settings: $checkedConvert(
              'setting_obj_list',
              (v) => (v as List<dynamic>)
                  .map((e) => Setting.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'exercise': 'obj',
        'text': 'setting_text',
        'hasWeight': 'has_weight',
        'comments': 'comment_list',
        'images': 'image_list',
        'settings': 'setting_obj_list'
      },
    );

Map<String, dynamic> _$WorkoutInfoExerciseToJson(
        WorkoutInfoExercise instance) =>
    <String, dynamic>{
      'obj': instance.exercise,
      'setting_text': instance.text,
      'has_weight': instance.hasWeight,
      'comment_list': instance.comments,
      'image_list': instance.images,
      'setting_obj_list': instance.settings,
    };
