import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

part 'edit_wod_event.dart';
part 'edit_wod_state.dart';

class EditWodBloc extends Bloc<EditWodEvent, EditWodState> {
  EditWodBloc({
    required WodGeneratorRepository wodGeneratorRepository,
    required Wod wod,
  })  : _wodGeneratorRepository = wodGeneratorRepository,
        super(EditWodState(wod: wod)) {
    on<EditWodGetDetail>(_onGetWodDetails);
    on<EditWodDelete>(_onDelete);

    add(const EditWodGetDetail());
  }

  final WodGeneratorRepository _wodGeneratorRepository;

  Future<void> _onGetWodDetails(
    EditWodGetDetail event,
    Emitter<EditWodState> emit,
  ) async {
    final wodWithDetails =
        await _wodGeneratorRepository.getWodDetails(state.wod.id.toString());
    emit(
      state.copyWith(
        wod: wodWithDetails,
      ),
    );
  }

  Future<void> _onDelete(
    EditWodDelete event,
    Emitter<EditWodState> emit,
  ) async {
    try {
      await _wodGeneratorRepository.deleteWod(state.wod);
      emit(
        state.copyWith(
          isDeleted: true,
        ),
      );
    } catch (e) {
      // TODO: error handling
    }
  }
}
