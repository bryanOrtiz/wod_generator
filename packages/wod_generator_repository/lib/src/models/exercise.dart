import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

@JsonSerializable()
class Exercise extends Equatable {
  const Exercise({
    required this.id,
    required this.name,
    required this.uuid,
    required this.description,
    required this.category,
    required this.muscles,
    required this.musclesSecondary,
    required this.equipment,
    required this.variations,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);

  final int id;
  final String name;
  final String uuid;
  final String description;
  final int category;
  final List<int> muscles;
  @JsonKey(name: 'muscles_secondary')
  final List<int> musclesSecondary;
  final List<int> equipment;
  final List<int> variations;

  @override
  List<Object?> get props => [
        id,
        name,
        uuid,
        description,
        category,
        muscles,
        musclesSecondary,
        equipment,
        variations
      ];
}
