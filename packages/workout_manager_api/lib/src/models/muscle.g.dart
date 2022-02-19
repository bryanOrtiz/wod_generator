// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'muscle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Muscle _$MuscleFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Muscle',
      json,
      ($checkedConvert) {
        final val = Muscle(
          name: $checkedConvert('name', (v) => v as String),
          isFront: $checkedConvert('is_front', (v) => v as bool),
          imageUrlMain: $checkedConvert(
              'image_url_main',
              (v) => (v as List<dynamic>)
                  .map((e) => Muscle.fromJson(e as Map<String, dynamic>))
                  .toList()),
          imageUrlSecondary: $checkedConvert(
              'image_url_secondary',
              (v) => (v as List<dynamic>)
                  .map((e) => Muscle.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'isFront': 'is_front',
        'imageUrlMain': 'image_url_main',
        'imageUrlSecondary': 'image_url_secondary'
      },
    );

Map<String, dynamic> _$MuscleToJson(Muscle instance) => <String, dynamic>{
      'name': instance.name,
      'is_front': instance.isFront,
      'image_url_main': instance.imageUrlMain,
      'image_url_secondary': instance.imageUrlSecondary,
    };
