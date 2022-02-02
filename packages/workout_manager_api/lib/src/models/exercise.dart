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
    required this.creationDate,
    required this.category,
    required this.muscles,
    required this.musclesSecondary,
    required this.equipment,
    required this.language,
    required this.license,
    required this.licenseAuthor,
    required this.variations,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);

  final int id;
  final String name;
  final String uuid;
  final String description;
  @JsonKey(name: 'creation_date')
  final String creationDate;
  final int category;
  final List<int> muscles;
  @JsonKey(name: 'muscles_secondary')
  final List<int> musclesSecondary;
  final List<int> equipment;
  final int language;
  final int license;
  @JsonKey(name: 'license_author')
  final String licenseAuthor;
  final List<int> variations;

  @override
  List<Object?> get props => [
        id,
        name,
        uuid,
        description,
        creationDate,
        category,
        muscles,
        musclesSecondary,
        equipment,
        language,
        license,
        licenseAuthor,
        variations
      ];
}
