// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Setting _$SettingFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Setting',
      json,
      ($checkedConvert) {
        final val = Setting(
          id: $checkedConvert('id', (v) => v as int),
          set: $checkedConvert('set', (v) => v as int),
          exercise: $checkedConvert('exercise', (v) => v as int),
          repitionUnit: $checkedConvert('repetition_unit', (v) => v as int),
          reps: $checkedConvert('reps', (v) => v as int),
          weight: $checkedConvert('weight', (v) => v as String),
          weightUnit: $checkedConvert('weight_unit', (v) => v as int),
          rir: $checkedConvert('rir', (v) => v as String?),
          order: $checkedConvert('order', (v) => v as int),
          comment: $checkedConvert('comment', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'repitionUnit': 'repetition_unit',
        'weightUnit': 'weight_unit'
      },
    );

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
      'id': instance.id,
      'set': instance.set,
      'exercise': instance.exercise,
      'repetition_unit': instance.repitionUnit,
      'reps': instance.reps,
      'weight': instance.weight,
      'weight_unit': instance.weightUnit,
      'rir': instance.rir,
      'order': instance.order,
      'comment': instance.comment,
    };
