import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suggestions.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  createToJson: false,
)
class Suggestions<T extends Equatable> extends Equatable {
  const Suggestions({
    required this.suggestions,
  });

  factory Suggestions.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$SuggestionsFromJson(json, fromJsonT);

  final List<SuggestionItem<T>>? suggestions;

  @override
  List<Object?> get props => [
        suggestions,
      ];
}

@JsonSerializable(
  genericArgumentFactories: true,
  createToJson: false,
)
class SuggestionItem<T extends Equatable> extends Equatable {
  const SuggestionItem({
    required this.value,
    required this.data,
  });

  factory SuggestionItem.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$SuggestionItemFromJson(json, fromJsonT);

  final String value;
  final T data;

  @override
  List<Object?> get props => [
        value,
        data,
      ];
}
