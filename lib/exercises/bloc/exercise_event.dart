part of 'exercise_bloc.dart';

abstract class ExerciseEvent extends Equatable {
  const ExerciseEvent();

  @override
  List<Object> get props => [];
}

class ExerciseSearchTermChanged extends ExerciseEvent {
  const ExerciseSearchTermChanged(this.term);

  final String term;

  @override
  List<Object> get props => [term];
}

class ExerciseSearchSelected extends ExerciseEvent {
  const ExerciseSearchSelected(this.searchExercise);

  final SearchExercise searchExercise;

  @override
  List<Object> get props => [searchExercise];
}
