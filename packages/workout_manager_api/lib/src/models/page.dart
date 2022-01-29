import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Page<T extends Equatable> extends Equatable {
  const Page({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory Page.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PageFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PageToJson(this, toJsonT);

  final int? count;
  final String? next;
  final int? previous;
  final List<T> results;

  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        results,
      ];
}
