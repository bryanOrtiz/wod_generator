part of 'wods_bloc.dart';

abstract class WodsEvent extends Equatable {
  const WodsEvent();

  @override
  List<Object> get props => [];
}

class WodsGetInitialState extends WodsEvent {
  const WodsGetInitialState();
}

class WodsChanged extends WodsEvent {
  const WodsChanged(this.wods);

  final List<Wod> wods;

  @override
  List<Object> get props => [wods];
}
