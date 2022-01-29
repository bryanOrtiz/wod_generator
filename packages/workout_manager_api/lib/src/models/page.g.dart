// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page<T> _$PageFromJson<T extends Equatable>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    $checkedCreate(
      'Page',
      json,
      ($checkedConvert) {
        final val = Page<T>(
          count: $checkedConvert('count', (v) => v as int?),
          next: $checkedConvert('next', (v) => v as String?),
          previous: $checkedConvert('previous', (v) => v as int?),
          results: $checkedConvert(
              'results', (v) => (v as List<dynamic>).map(fromJsonT).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$PageToJson<T extends Equatable>(
  Page<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results.map(toJsonT).toList(),
    };
