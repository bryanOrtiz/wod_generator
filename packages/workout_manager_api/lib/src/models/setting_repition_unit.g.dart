// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'setting_repition_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingRepitionUnit _$SettingRepitionUnitFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SettingRepitionUnit',
      json,
      ($checkedConvert) {
        final val = SettingRepitionUnit(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$SettingRepitionUnitToJson(
        SettingRepitionUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
