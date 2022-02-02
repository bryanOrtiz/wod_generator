// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Set _$SetFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Set',
      json,
      ($checkedConvert) {
        final val = Set(
          id: $checkedConvert('id', (v) => v as int),
          exerciseDay: $checkedConvert('exerciseday', (v) => v as int),
          sets: $checkedConvert('sets', (v) => v as int),
          order: $checkedConvert('order', (v) => v as int),
          comment: $checkedConvert('comment', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'exerciseDay': 'exerciseday'},
    );

Map<String, dynamic> _$SetToJson(Set instance) => <String, dynamic>{
      'id': instance.id,
      'exerciseday': instance.exerciseDay,
      'sets': instance.sets,
      'order': instance.order,
      'comment': instance.comment,
    };
