import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'workout_info_set.g.dart';

@JsonSerializable()
class WorkoutInfoSet extends Equatable {
  const WorkoutInfoSet({
    required this.set,
    required this.exercises,
    required this.isSuperset,
  });

  factory WorkoutInfoSet.fromJson(Map<String, dynamic> json) =>
      _$WorkoutInfoSetFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutInfoSetToJson(this);

  @JsonKey(name: 'obj')
  final Set set;
  @JsonKey(name: 'exercise_list')
  final List<WorkoutInfoExercise> exercises;
  @JsonKey(name: 'is_superset')
  final bool isSuperset;

  @override
  List<Object?> get props => [
        set,
        exercises,
        isSuperset,
      ];
}
