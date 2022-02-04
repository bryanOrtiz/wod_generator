// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'search_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchExercise _$SearchExerciseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SearchExercise',
      json,
      ($checkedConvert) {
        final val = SearchExercise(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          category: $checkedConvert('category', (v) => v as String),
          image: $checkedConvert('image', (v) => v as String?),
          imageThumbnail:
              $checkedConvert('image_thumbnail', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'imageThumbnail': 'image_thumbnail'},
    );

Map<String, dynamic> _$SearchExerciseToJson(SearchExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'image': instance.image,
      'image_thumbnail': instance.imageThumbnail,
    };
