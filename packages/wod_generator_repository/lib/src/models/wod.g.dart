// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'wod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wod _$WodFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Wod',
      json,
      ($checkedConvert) {
        final val = Wod(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          creationDate: $checkedConvert('creation_date', (v) => v as String),
          parts: $checkedConvert(
              'parts',
              (v) => (v as List<dynamic>)
                  .map((e) => WorkoutPart.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'creationDate': 'creation_date'},
    );

Map<String, dynamic> _$WodToJson(Wod instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'creation_date': instance.creationDate,
      'parts': instance.parts,
    };
