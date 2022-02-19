import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

part 'wods_event.dart';
part 'wods_state.dart';

class WodsBloc extends Bloc<WodsEvent, WodsState> {
  WodsBloc({required WodGeneratorRepository wodGeneratorRepository})
      : _wodGeneratorRepository = wodGeneratorRepository,
        super(const WodsState()) {
    on<WodsGetInitialState>(_onGetWods);
    on<WodsChanged>(_onWodsChanged);

    _wodsSubscription =
        _wodGeneratorRepository.wods.listen((wods) => add(WodsChanged(wods)));

    add(const WodsGetInitialState());
  }

  final WodGeneratorRepository _wodGeneratorRepository;
  late StreamSubscription<List<Wod>> _wodsSubscription;

  @override
  Future<void> close() {
    _wodsSubscription.cancel();
    _wodGeneratorRepository.dispose();
    return super.close();
  }

  Future<void> _onGetWods(
    WodsGetInitialState event,
    Emitter<WodsState> emit,
  ) async {
    await _wodGeneratorRepository.getWods();
  }

  Future<void> _onWodsChanged(
    WodsChanged event,
    Emitter<WodsState> emit,
  ) async {
    emit(state.copyWith(wods: event.wods));
  }
}
