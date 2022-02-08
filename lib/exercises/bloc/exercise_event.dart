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

class ExerciseStepChanged extends ExerciseEvent {
  const ExerciseStepChanged(this.step);

  final int step;

  @override
  List<Object> get props => [step];
}

class ExerciseGetInitialData extends ExerciseEvent {
  const ExerciseGetInitialData();
}

class ExerciseSearchSelected extends ExerciseEvent {
  const ExerciseSearchSelected(this.searchExercise);

  final SearchExercise searchExercise;

  @override
  List<Object> get props => [searchExercise];
}

class ExerciseNumberOfSetsChanged extends ExerciseEvent {
  const ExerciseNumberOfSetsChanged(this.numberOfSets);

  final String numberOfSets;

  @override
  List<Object> get props => [numberOfSets];
}

class ExerciseSelectedWeightUnitChanged extends ExerciseEvent {
  const ExerciseSelectedWeightUnitChanged(this.weightUnit);

  final String weightUnit;

  @override
  List<Object> get props => [weightUnit];
}
