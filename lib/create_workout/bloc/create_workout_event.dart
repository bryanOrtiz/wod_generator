part of 'create_workout_bloc.dart';

abstract class CreateWorkoutEvent extends Equatable {
  const CreateWorkoutEvent();

  @override
  List<Object> get props => [];
}

class CreateWorkoutStepChanged extends CreateWorkoutEvent {
  const CreateWorkoutStepChanged(this.step);

  final int step;

  @override
  List<Object> get props => [step];
}

class CreateWorkoutNameChanged extends CreateWorkoutEvent {
  const CreateWorkoutNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class CreateWorkoutDescriptionChanged extends CreateWorkoutEvent {
  const CreateWorkoutDescriptionChanged(this.description);

  final String description;

  @override
  List<Object> get props => [description];
}

class CreateWorkoutPartConfirmed extends CreateWorkoutEvent {
  const CreateWorkoutPartConfirmed(this.part);

  final CreateWorkoutPart part;

  @override
  List<Object> get props => [part];
}
