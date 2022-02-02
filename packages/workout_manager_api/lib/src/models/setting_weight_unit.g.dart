// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'setting_weight_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingWeightUnit _$SettingWeightUnitFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SettingWeightUnit',
      json,
      ($checkedConvert) {
        final val = SettingWeightUnit(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$SettingWeightUnitToJson(SettingWeightUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
