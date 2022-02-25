part of 'edit_wod_bloc.dart';

abstract class EditWodEvent extends Equatable {
  const EditWodEvent();

  @override
  List<Object> get props => [];
}

class EditWodGetDetail extends EditWodEvent {
  const EditWodGetDetail();
}

class EditWodDelete extends EditWodEvent {
  const EditWodDelete();
}

class EditWodOnUpdate extends EditWodEvent {
  const EditWodOnUpdate();
}

class EditWodEditToggled extends EditWodEvent {
  const EditWodEditToggled();
}

class EditWodUpdateToggled extends EditWodEvent {
  const EditWodUpdateToggled();
}

class EditWodNameChanged extends EditWodEvent {
  const EditWodNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [
        name,
      ];
}

class EditWodDescriptionChanged extends EditWodEvent {
  const EditWodDescriptionChanged(this.description);

  final String description;

  @override
  List<Object> get props => [
        description,
      ];
}
