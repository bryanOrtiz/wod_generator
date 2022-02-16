part of 'wods_bloc.dart';

abstract class WodsEvent extends Equatable {
  const WodsEvent();

  @override
  List<Object> get props => [];
}

class WodsGetInitialState extends WodsEvent {
  const WodsGetInitialState();
}
