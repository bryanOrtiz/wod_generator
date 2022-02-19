import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'workout_info_muscle.g.dart';

@JsonSerializable()
class WorkoutInfoMuscle extends Equatable {
  const WorkoutInfoMuscle({
    required this.frontMuscles,
    required this.backMuscles,
    required this.frontSecondaryMuscles,
    required this.backSecondaryMuscles,
  });

  factory WorkoutInfoMuscle.fromJson(Map<String, dynamic> json) =>
      _$WorkoutInfoMuscleFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutInfoMuscleToJson(this);

  @JsonKey(name: 'front')
  final List<Muscle> frontMuscles;
  @JsonKey(name: 'back')
  final List<Muscle> backMuscles;
  @JsonKey(name: 'frontsecondary')
  final List<Muscle> frontSecondaryMuscles;
  @JsonKey(name: 'backsecondary')
  final List<Muscle> backSecondaryMuscles;

  @override
  List<Object?> get props => [
        frontMuscles,
        backMuscles,
        frontSecondaryMuscles,
        backSecondaryMuscles,
      ];
}
