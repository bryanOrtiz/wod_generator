part of 'exercise_bloc.dart';

class ExerciseState extends Equatable {
  const ExerciseState({
    this.step = 0,
    this.searchTerm = const SearchTerm.pure(),
    this.exercises = const [],
    this.selectedExercise,
    this.numberOfSets = 0,
    this.weightUnits = const [],
  });

  final int step;
  final SearchTerm searchTerm;
  final List<SearchExercise> exercises;
  final SearchExercise? selectedExercise;
  final int numberOfSets;
  final List<WeightUnit> weightUnits;

  ExerciseState copyWith({
    int? step,
    SearchTerm? searchTerm,
    List<SearchExercise>? exercises,
    SearchExercise? selectedExercise,
    int? numberOfSets,
    List<WeightUnit>? weightUnits,
  }) {
    return ExerciseState(
      step: step ?? this.step,
      searchTerm: searchTerm ?? this.searchTerm,
      exercises: exercises ?? this.exercises,
      selectedExercise: selectedExercise ?? this.selectedExercise,
      numberOfSets: numberOfSets ?? this.numberOfSets,
      weightUnits: weightUnits ?? this.weightUnits,
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
      ];
}
