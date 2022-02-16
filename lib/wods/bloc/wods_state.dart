part of 'wods_bloc.dart';

class WodsState extends Equatable {
  const WodsState({
    this.wods,
  });

  final List<Wod>? wods;

  WodsState copyWith({
    required List<Wod>? wods,
  }) {
    return WodsState(
      wods: wods ?? this.wods,
    );
  }

  @override
  List<Object?> get props => [
        wods,
      ];
}
