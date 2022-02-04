// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'suggestions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Suggestions<T> _$SuggestionsFromJson<T extends Equatable>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    $checkedCreate(
      'Suggestions',
      json,
      ($checkedConvert) {
        final val = Suggestions<T>(
          suggestions: $checkedConvert(
              'suggestions',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => SuggestionItem<T>.fromJson(
                      e as Map<String, dynamic>, (value) => fromJsonT(value)))
                  .toList()),
        );
        return val;
      },
    );

SuggestionItem<T> _$SuggestionItemFromJson<T extends Equatable>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    $checkedCreate(
      'SuggestionItem',
      json,
      ($checkedConvert) {
        final val = SuggestionItem<T>(
          value: $checkedConvert('value', (v) => v as String),
          data: $checkedConvert('data', (v) => fromJsonT(v)),
        );
        return val;
      },
    );
