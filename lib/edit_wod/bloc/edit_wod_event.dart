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
