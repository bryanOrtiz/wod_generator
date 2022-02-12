import 'package:equatable/equatable.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

class CreateWorkoutPart extends Equatable {
  const CreateWorkoutPart({
    required this.exercise,
    required this.weightUnit,
    required this.sets,
    required this.comment,
  });

  const CreateWorkoutPart.initial({
    this.exercise,
    this.weightUnit = 1,
    this.sets = const [WorkoutSet(reps: 1)],
    this.comment = '',
  });

  final SearchExercise? exercise;
  final int weightUnit;
  final List<WorkoutSet> sets;
  final String comment;

  CreateWorkoutPart copyWith({
    SearchExercise? exercise,
    int? weightUnit,
    List<WorkoutSet>? sets,
    String? comment,
  }) {
    return CreateWorkoutPart(
        exercise: exercise ?? this.exercise,
        weightUnit: weightUnit ?? this.weightUnit,
        sets: sets ?? this.sets,
        comment: comment ?? this.comment);
  }

  @override
  List<Object?> get props => [
        exercise,
        weightUnit,
        sets,
        comment,
      ];
}

extension CreateWorkoutDescription on CreateWorkoutPart {
  String description() {
    var retVal = '';
    sets.asMap().forEach((index, value) {
      final newLine = index == sets.length - 1 ? '' : '\n';
      retVal += '1 x ${value.reps}' + newLine;
    });
    return retVal;
  }
}
