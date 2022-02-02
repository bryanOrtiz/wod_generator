import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set.g.dart';

@JsonSerializable()
class Set extends Equatable {
  const Set({
    required this.id,
    required this.exerciseDay,
    required this.sets,
    required this.order,
    required this.comment,
  });

  factory Set.fromJson(Map<String, dynamic> json) => _$SetFromJson(json);

  Map<String, dynamic> toJson() => _$SetToJson(this);

  final int id;
  @JsonKey(name: 'exerciseday')
  final int exerciseDay;
  final int sets;
  final int order;
  final String comment;

  @override
  List<Object?> get props => [
        id,
        exerciseDay,
        sets,
        order,
        comment,
      ];
}
