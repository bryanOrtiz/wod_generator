part of 'create_workout_part_bloc.dart';

abstract class CreateWorkoutPartEvent extends Equatable {
  const CreateWorkoutPartEvent();

  @override
  List<Object> get props => [];
}

class CreateWorkoutPartSearchTermChanged extends CreateWorkoutPartEvent {
  const CreateWorkoutPartSearchTermChanged(this.term);

  final String term;

  @override
  List<Object> get props => [term];
}

class CreateWorkoutPartStepChanged extends CreateWorkoutPartEvent {
  const CreateWorkoutPartStepChanged(this.step);

  final int step;

  @override
  List<Object> get props => [step];
}

class CreateWorkoutPartGetInitialData extends CreateWorkoutPartEvent {
  const CreateWorkoutPartGetInitialData();
}

class CreateWorkoutPartSearchSelected extends CreateWorkoutPartEvent {
  const CreateWorkoutPartSearchSelected(this.searchExercise);

  final SearchExercise searchExercise;

  @override
  List<Object> get props => [searchExercise];
}

class CreateWorkoutPartExerciseConfirmed extends CreateWorkoutPartEvent {
  const CreateWorkoutPartExerciseConfirmed();
}

class CreateWorkoutPartNumberOfSetsChanged extends CreateWorkoutPartEvent {
  const CreateWorkoutPartNumberOfSetsChanged(this.numberOfSets);

  final String numberOfSets;

  @override
  List<Object> get props => [numberOfSets];
}

class CreateWorkoutPartSelectedWeightUnitChanged
    extends CreateWorkoutPartEvent {
  const CreateWorkoutPartSelectedWeightUnitChanged(this.weightUnit);

  final String weightUnit;

  @override
  List<Object> get props => [weightUnit];
}

class CreateWorkoutPartRepForSetChanged extends CreateWorkoutPartEvent {
  const CreateWorkoutPartRepForSetChanged(this.set, this.reps);

  final int set;
  final String reps;

  @override
  List<Object> get props => [
        set,
        reps,
      ];
}

class CreateWorkoutPartRepForSetConfirmed extends CreateWorkoutPartEvent {
  const CreateWorkoutPartRepForSetConfirmed();
}

class CreateWorkoutPartCommentChanged extends CreateWorkoutPartEvent {
  const CreateWorkoutPartCommentChanged(this.comment);

  final String comment;

  @override
  List<Object> get props => [comment];
}

class CreateWorkoutPartCommentConfirmed extends CreateWorkoutPartEvent {
  const CreateWorkoutPartCommentConfirmed();
}
