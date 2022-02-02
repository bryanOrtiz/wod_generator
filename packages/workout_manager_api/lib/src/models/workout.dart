import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Workout extends Equatable {
  const Workout({
    required this.id,
    required this.name,
    required this.description,
    required this.creationDate,
  });

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutToJson(this);

  final int id;
  final String name;
  final String description;
  @JsonKey(name: 'creation_date')
  final String creationDate;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        creationDate,
      ];
}
