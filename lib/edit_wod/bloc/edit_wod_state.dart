part of 'edit_wod_bloc.dart';

class EditWodState extends Equatable {
  const EditWodState({
    required this.wod,
    this.isEditable = false,
    this.name = const WorkoutName.pure(),
    this.description = const WorkoutDescription.pure(),
    this.deleteStatus = FormzSubmissionStatus.initial,
    this.updateStatus = FormzSubmissionStatus.initial,
  });

  final Wod wod;
  final bool isEditable;
  final WorkoutName name;
  final WorkoutDescription description;

  final FormzSubmissionStatus deleteStatus;
  final FormzSubmissionStatus updateStatus;

  EditWodState copyWith({
    Wod? wod,
    WorkoutName? name,
    WorkoutDescription? description,
    bool? isEditable,
    FormzSubmissionStatus? deleteStatus,
    FormzSubmissionStatus? updateStatus,
  }) {
    return EditWodState(
      wod: wod ?? this.wod,
      name: name ?? this.name,
      description: description ?? this.description,
      isEditable: isEditable ?? this.isEditable,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      updateStatus: updateStatus ?? this.updateStatus,
    );
  }

  @override
  List<Object> get props => [
        wod,
        name,
        description,
        isEditable,
        deleteStatus,
        updateStatus,
      ];
}
