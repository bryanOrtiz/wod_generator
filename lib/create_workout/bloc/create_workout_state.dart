part of 'create_workout_bloc.dart';

class CreateWorkoutState extends Equatable {
  const CreateWorkoutState({
    this.step = 0,
    this.name = const WorkoutName.pure(),
    this.description = const WorkoutDescription.pure(),
    this.partsInput = const WorkoutPartsInput.pure(),
    this.wod = const Wod(
      id: 1,
      name: '',
      description: '',
      creationDate: '',
      parts: [],
    ),
    this.status = FormzSubmissionStatus.initial,
  });

  final int step;
  final WorkoutName name;
  final WorkoutDescription description;
  final WorkoutPartsInput partsInput;
  final Wod wod;
  final FormzSubmissionStatus status;

  CreateWorkoutState copyWith({
    int? step,
    WorkoutName? name,
    WorkoutDescription? description,
    WorkoutPartsInput? partsInput,
    Wod? wod,
    FormzSubmissionStatus? status,
  }) {
    return CreateWorkoutState(
      step: step ?? this.step,
      name: name ?? this.name,
      description: description ?? this.description,
      partsInput: partsInput ?? this.partsInput,
      wod: wod ?? this.wod,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        step,
        name,
        description,
        partsInput,
        wod,
        status,
      ];
}
