import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_set.g.dart';

@JsonSerializable()
class WorkoutSet extends Equatable {
  const WorkoutSet({
    required this.reps,
  });

  factory WorkoutSet.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSetFromJson(json);

  final int reps;

  WorkoutSet copyWith({
    int? reps,
  }) {
    return WorkoutSet(reps: reps ?? this.reps);
  }

  @override
  List<Object> get props => [
        reps,
      ];
}
