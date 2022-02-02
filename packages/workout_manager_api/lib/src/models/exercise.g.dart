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
          creationDate: $checkedConvert('creation_date', (v) => v as String),
          category: $checkedConvert('category', (v) => v as int),
          muscles: $checkedConvert('muscles',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          musclesSecondary: $checkedConvert('muscles_secondary',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          equipment: $checkedConvert('equipment',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          language: $checkedConvert('language', (v) => v as int),
          license: $checkedConvert('license', (v) => v as int),
          licenseAuthor: $checkedConvert('license_author', (v) => v as String),
          variations: $checkedConvert('variations',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'creationDate': 'creation_date',
        'musclesSecondary': 'muscles_secondary',
        'licenseAuthor': 'license_author'
      },
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'uuid': instance.uuid,
      'description': instance.description,
      'creation_date': instance.creationDate,
      'category': instance.category,
      'muscles': instance.muscles,
      'muscles_secondary': instance.musclesSecondary,
      'equipment': instance.equipment,
      'language': instance.language,
      'license': instance.license,
      'license_author': instance.licenseAuthor,
      'variations': instance.variations,
    };
