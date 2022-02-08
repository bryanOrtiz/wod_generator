part of 'exercise_bloc.dart';

class ExerciseState extends Equatable {
  const ExerciseState({
    this.step = 0,
    this.searchTerm = const SearchTerm.pure(),
    this.exercises = const [],
    this.selectedExercise,
    this.numberOfSets = 1,
    this.weightUnits = const [],
    this.selectedWeightUnit = const WeightUnit(id: 1, name: 'lb'),
  });

  final int step;
  final SearchTerm searchTerm;
  final List<SearchExercise> exercises;
  final SearchExercise? selectedExercise;
  final int numberOfSets;
  final List<WeightUnit> weightUnits;
  final WeightUnit selectedWeightUnit;

  ExerciseState copyWith({
    int? step,
    SearchTerm? searchTerm,
    List<SearchExercise>? exercises,
    SearchExercise? selectedExercise,
    int? numberOfSets,
    List<WeightUnit>? weightUnits,
    WeightUnit? selectedWeightUnit,
  }) {
    return ExerciseState(
      step: step ?? this.step,
      searchTerm: searchTerm ?? this.searchTerm,
      exercises: exercises ?? this.exercises,
      selectedExercise: selectedExercise ?? this.selectedExercise,
      numberOfSets: numberOfSets ?? this.numberOfSets,
      weightUnits: weightUnits ?? this.weightUnits,
      selectedWeightUnit: selectedWeightUnit ?? this.selectedWeightUnit,
    );
  }

  @override
  List<Object?> get props => [
        step,
        searchTerm,
        exercises,
        selectedExercise,
        numberOfSets,
        weightUnits,
        selectedWeightUnit,
      ];
}
