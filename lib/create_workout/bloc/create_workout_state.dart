part of 'create_workout_bloc.dart';

class CreateWorkoutState extends Equatable {
  const CreateWorkoutState({
    this.step = 0,
    this.description = '',
    this.wod = const Wod(
      id: 1,
      name: '',
      description: '',
      creationDate: '',
      parts: [],
    ),
  });

  final int step;
  final String description;
  final Wod wod;

  CreateWorkoutState copyWith({
    int? step,
    String? nameOfWorkout,
    String? description,
    Wod? wod,
  }) {
    return CreateWorkoutState(
      step: step ?? this.step,
      description: description ?? this.description,
      wod: wod ?? this.wod,
    );
  }

  @override
  List<Object?> get props => [
        step,
        description,
        wod,
      ];
}
