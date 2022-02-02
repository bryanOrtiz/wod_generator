// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workout _$WorkoutFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Workout',
      json,
      ($checkedConvert) {
        final val = Workout(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          creationDate: $checkedConvert('creation_date', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'creationDate': 'creation_date'},
    );

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'creation_date': instance.creationDate,
    };
