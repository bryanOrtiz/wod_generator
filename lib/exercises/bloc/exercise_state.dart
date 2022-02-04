part of 'exercise_bloc.dart';

class ExerciseState extends Equatable {
  const ExerciseState({
    this.searchTerm = const SearchTerm.pure(),
    this.exercises = const [],
    this.selectedExercise,
  });

  final SearchTerm searchTerm;
  final List<SearchExercise> exercises;
  final SearchExercise? selectedExercise;

  ExerciseState copyWith({
    SearchTerm? searchTerm,
    List<SearchExercise>? exercises,
    SearchExercise? selectedExercise,
  }) {
    return ExerciseState(
      searchTerm: searchTerm ?? this.searchTerm,
      exercises: exercises ?? this.exercises,
      selectedExercise: selectedExercise ?? this.selectedExercise,
    );
  }

  @override
  List<Object?> get props => [
        searchTerm,
        exercises,
        selectedExercise,
      ];
}
