part of 'create_workout_bloc.dart';

class CreateWorkoutState extends Equatable {
  const CreateWorkoutState({
    this.step = 0,
    this.nameOfWorkout = '',
    this.description = '',
    this.workoutParts = const [],
  });

  final int step;
  final String nameOfWorkout;
  final String description;
  final List<CreateWorkoutPart> workoutParts;

  CreateWorkoutState copyWith({
    int? step,
    String? nameOfWorkout,
    String? description,
    List<CreateWorkoutPart>? workoutParts,
  }) {
    return CreateWorkoutState(
      step: step ?? this.step,
      nameOfWorkout: nameOfWorkout ?? this.nameOfWorkout,
      description: description ?? this.description,
      workoutParts: workoutParts ?? this.workoutParts,
    );
  }

  @override
  List<Object> get props => [
        step,
        nameOfWorkout,
        description,
        workoutParts,
      ];
}
