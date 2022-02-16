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

    add(const WodsGetInitialState());
  }

  final WodGeneratorRepository _wodGeneratorRepository;

  Future<void> _onGetWods(
    WodsGetInitialState event,
    Emitter<WodsState> emit,
  ) async {
    final wods = await _wodGeneratorRepository.getWods();
    emit(state.copyWith(wods: wods));
  }
}
