// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Exercise',
      json,
      ($checkedConvert) {
        final val = Exercise(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          uuid: $checkedConvert('uuid', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          category: $checkedConvert('category', (v) => v as int),
          muscles: $checkedConvert('muscles',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          musclesSecondary: $checkedConvert('muscles_secondary',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          equipment: $checkedConvert('equipment',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          variations: $checkedConvert('variations',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
        );
        return val;
      },
      fieldKeyMap: const {'musclesSecondary': 'muscles_secondary'},
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'uuid': instance.uuid,
      'description': instance.description,
      'category': instance.category,
      'muscles': instance.muscles,
      'muscles_secondary': instance.musclesSecondary,
      'equipment': instance.equipment,
      'variations': instance.variations,
    };
