// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'weight_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeightUnit _$WeightUnitFromJson(Map<String, dynamic> json) => $checkedCreate(
      'WeightUnit',
      json,
      ($checkedConvert) {
        final val = WeightUnit(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$WeightUnitToJson(WeightUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
