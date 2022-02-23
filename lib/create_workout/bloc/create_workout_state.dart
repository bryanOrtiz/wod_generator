part of 'create_workout_bloc.dart';

class CreateWorkoutState extends Equatable {
  const CreateWorkoutState({
    this.step = 0,
    this.name = const WorkoutName.pure(),
    this.description = const WorkoutDescription.pure(),
    this.wod = const Wod(
      id: 1,
      name: '',
      description: '',
      creationDate: '',
      parts: [],
    ),
    this.status = FormzStatus.pure,
  });

  final int step;
  final WorkoutName name;
  final WorkoutDescription description;
  final Wod wod;
  final FormzStatus status;

  CreateWorkoutState copyWith({
    int? step,
    WorkoutName? name,
    WorkoutDescription? description,
    Wod? wod,
    FormzStatus? status,
  }) {
    return CreateWorkoutState(
      step: step ?? this.step,
      name: name ?? this.name,
      description: description ?? this.description,
      wod: wod ?? this.wod,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        step,
        name,
        description,
        wod,
        status,
      ];
}
