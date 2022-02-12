import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

part 'workout_part.g.dart';

@JsonSerializable()
class WorkoutPart extends Equatable {
  const WorkoutPart({
    required this.id,
    required this.exercise,
    required this.weightUnit,
    required this.sets,
    required this.comment,
  });

  factory WorkoutPart.fromJson(Map<String, dynamic> json) =>
      _$WorkoutPartFromJson(json);

  final int id;
  final SearchExercise exercise;
  final int weightUnit;
  final List<WorkoutSet> sets;
  final String comment;

  WorkoutPart copyWith({
    int? id,
    SearchExercise? exercise,
    int? weightUnit,
    List<WorkoutSet>? sets,
    String? comment,
  }) {
    return WorkoutPart(
        id: id ?? this.id,
        exercise: exercise ?? this.exercise,
        weightUnit: weightUnit ?? this.weightUnit,
        sets: sets ?? this.sets,
        comment: comment ?? this.comment);
  }

  @override
  List<Object?> get props => [
        id,
        exercise,
        weightUnit,
        sets,
        comment,
      ];
}
