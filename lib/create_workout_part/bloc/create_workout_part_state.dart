part of 'create_workout_part_bloc.dart';

class CreateWorkoutPartState extends Equatable {
  const CreateWorkoutPartState({
    this.step = 0,
    this.searchTerm = const SearchTerm.pure(),
    this.exercises = const [],
    this.selectedExercise,
    this.sets = const [WorkoutSet(reps: 1)],
    this.weightUnits = const [],
    this.selectedWeightUnit = const WeightUnit(id: 1, name: 'lb'),
    this.comment = '',
    this.part = const WorkoutPart.initial(),
  });

  final int step;
  final SearchTerm searchTerm;
  final List<SearchExercise> exercises;
  final SearchExercise? selectedExercise;
  final List<WorkoutSet> sets;
  final List<WeightUnit> weightUnits;
  final WeightUnit selectedWeightUnit;
  final String comment;
  final WorkoutPart part;

  CreateWorkoutPartState copyWith({
    int? step,
    SearchTerm? searchTerm,
    List<SearchExercise>? exercises,
    SearchExercise? selectedExercise,
    List<WorkoutSet>? sets,
    List<WeightUnit>? weightUnits,
    WeightUnit? selectedWeightUnit,
    String? comment,
    WorkoutPart? part,
  }) {
    return CreateWorkoutPartState(
      step: step ?? this.step,
      searchTerm: searchTerm ?? this.searchTerm,
      exercises: exercises ?? this.exercises,
      selectedExercise: selectedExercise ?? this.selectedExercise,
      sets: sets ?? this.sets,
      weightUnits: weightUnits ?? this.weightUnits,
      selectedWeightUnit: selectedWeightUnit ?? this.selectedWeightUnit,
      comment: comment ?? this.comment,
      part: part ?? this.part,
    );
  }

  @override
  List<Object?> get props => [
        step,
        searchTerm,
        exercises,
        selectedExercise,
        sets,
        weightUnits,
        selectedWeightUnit,
        comment,
        part,
      ];
}
