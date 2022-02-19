part of 'edit_wod_bloc.dart';

class EditWodState extends Equatable {
  const EditWodState({required this.wod, this.isDeleted = false});

  final Wod wod;
  final bool isDeleted;

  EditWodState copyWith({
    Wod? wod,
    bool? isDeleted,
  }) {
    return EditWodState(
      wod: wod ?? this.wod,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object> get props => [wod, isDeleted];
}
