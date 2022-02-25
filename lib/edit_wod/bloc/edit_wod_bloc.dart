import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:wod_generator/edit_wod/models/models.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

part 'edit_wod_event.dart';
part 'edit_wod_state.dart';

class EditWodBloc extends Bloc<EditWodEvent, EditWodState> {
  EditWodBloc({
    required WodGeneratorRepository wodGeneratorRepository,
    required Wod wod,
  })  : _wodGeneratorRepository = wodGeneratorRepository,
        super(
          EditWodState(
            wod: wod,
            name: WorkoutName.dirty(value: wod.name),
            description: WorkoutDescription.dirty(value: wod.description),
          ),
        ) {
    on<EditWodGetDetail>(_onGetWodDetails);
    on<EditWodDelete>(_onDelete);
    on<EditWodEditToggled>(_onEditModeToggled);
    on<EditWodUpdateToggled>(_onUpdateToggled);
    on<EditWodNameChanged>(_onNameChanged);
    on<EditWodDescriptionChanged>(_onDescriptionChanged);
    on<EditWodOnUpdate>(_onUpdate);

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
      emit(
        state.copyWith(
          deleteStatus: FormzStatus.submissionInProgress,
        ),
      );
      await _wodGeneratorRepository.deleteWod(state.wod);
      emit(
        state.copyWith(
          deleteStatus: FormzStatus.submissionSuccess,
        ),
      );
    } catch (e) {
      // TODO: error handling
      emit(
        state.copyWith(
          deleteStatus: FormzStatus.submissionFailure,
        ),
      );
      addError(e, StackTrace.current);
    }
  }

  Future<void> _onUpdate(
    EditWodOnUpdate event,
    Emitter<EditWodState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          updateStatus: FormzStatus.submissionInProgress,
        ),
      );
      await Future.delayed(const Duration(milliseconds: 500));
      emit(
        state.copyWith(
          updateStatus: FormzStatus.submissionSuccess,
        ),
      );
    } catch (e) {
      // TODO: error handling
      emit(
        state.copyWith(
          updateStatus: FormzStatus.submissionFailure,
        ),
      );
      addError(e, StackTrace.current);
    }
  }

  void _onEditModeToggled(
    EditWodEditToggled event,
    Emitter<EditWodState> emit,
  ) {
    emit(
      state.copyWith(
        isEditable: true,
      ),
    );
  }

  void _onUpdateToggled(
    EditWodUpdateToggled event,
    Emitter<EditWodState> emit,
  ) {
    emit(
      state.copyWith(
        isEditable: false,
      ),
    );
  }

  void _onNameChanged(
    EditWodNameChanged event,
    Emitter<EditWodState> emit,
  ) {
    final name = WorkoutName.dirty(value: event.name);
    emit(
      state.copyWith(
        name: name,
      ),
    );
  }

  void _onDescriptionChanged(
    EditWodDescriptionChanged event,
    Emitter<EditWodState> emit,
  ) {
    final description = WorkoutDescription.dirty(value: event.description);
    emit(
      state.copyWith(
        description: description,
      ),
    );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
  }
}
