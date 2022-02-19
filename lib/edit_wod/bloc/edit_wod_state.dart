part of 'edit_wod_bloc.dart';

class EditWodState extends Equatable {
  const EditWodState({
    required this.wod,
    this.isDeleted = false,
    this.isEditable = false,
  });

  final Wod wod;
  final bool isDeleted;
  final bool isEditable;

  EditWodState copyWith({
    Wod? wod,
    bool? isDeleted,
    bool? isEditable,
  }) {
    return EditWodState(
      wod: wod ?? this.wod,
      isDeleted: isDeleted ?? this.isDeleted,
      isEditable: isEditable ?? this.isEditable,
    );
  }

  @override
  List<Object> get props => [
        wod,
        isDeleted,
        isEditable,
      ];
}
