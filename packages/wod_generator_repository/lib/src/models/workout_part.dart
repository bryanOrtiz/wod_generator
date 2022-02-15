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

  const WorkoutPart.initial({
    this.id,
    this.exercise,
    this.weightUnit = 1,
    this.sets = const [WorkoutSet(reps: 1)],
    this.comment = '',
  });

  factory WorkoutPart.fromJson(Map<String, dynamic> json) =>
      _$WorkoutPartFromJson(json);

  final int? id;
  final SearchExercise? exercise;
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

extension CreateWorkoutDescription on WorkoutPart {
  String description() {
    var retVal = '';
    sets.asMap().forEach((index, value) {
      final newLine = index == sets.length - 1 ? '' : '\n';
      retVal += '1 x ${value.reps}' + newLine;
    });
    return retVal;
  }
}
