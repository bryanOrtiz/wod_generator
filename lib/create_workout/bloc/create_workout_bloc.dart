import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:wod_generator/create_workout/models/models.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

part 'create_workout_event.dart';
part 'create_workout_state.dart';

class CreateWorkoutBloc extends Bloc<CreateWorkoutEvent, CreateWorkoutState> {
  CreateWorkoutBloc({required WodGeneratorRepository wodGeneratorRepository})
      : _wodGeneratorRepository = wodGeneratorRepository,
        super(const CreateWorkoutState()) {
    on<CreateWorkoutStepChanged>(_onStepChanged);
    on<CreateWorkoutNameChanged>(_onNameOfWorkoutChanged);
    on<CreateWorkoutDescriptionChanged>(_onDescriptionChanged);
    on<CreateWorkoutDescriptionConfirmed>(_onDescriptionConfirmed);
    on<CreateWorkoutPartConfirmed>(_onCreateWorkoutPartConfirmed);
    on<CreateWorkoutConfirmed>(_onCreateWorkoutConfirmed);
  }

  final WodGeneratorRepository _wodGeneratorRepository;

  void _onStepChanged(
    CreateWorkoutStepChanged event,
    Emitter<CreateWorkoutState> emit,
  ) {
    emit(
      state.copyWith(
        step: event.step,
      ),
    );
  }

  void _onNameOfWorkoutChanged(
    CreateWorkoutNameChanged event,
    Emitter<CreateWorkoutState> emit,
  ) {
    final name = WorkoutName.dirty(event.name);
    final isValid = Formz.validate(
      [
        name,
        state.description,
        state.partsInput,
      ],
    );
    emit(
      state.copyWith(
        name: name,
        wod: state.wod.copyWith(name: name.value),
        status: isValid
            ? FormzSubmissionStatus.inProgress
            : FormzSubmissionStatus.failure,
      ),
    );
  }

  void _onDescriptionChanged(
    CreateWorkoutDescriptionChanged event,
    Emitter<CreateWorkoutState> emit,
  ) {
    final description = WorkoutDescription.dirty(event.description);
    final isValid = Formz.validate(
      [
        state.name,
        description,
        state.partsInput,
      ],
    );
    emit(
      state.copyWith(
        description: description,
        status: isValid
            ? FormzSubmissionStatus.inProgress
            : FormzSubmissionStatus.failure,
      ),
    );
  }

  void _onDescriptionConfirmed(
    CreateWorkoutDescriptionConfirmed event,
    Emitter<CreateWorkoutState> emit,
  ) {
    emit(
      state.copyWith(
        wod: state.wod.copyWith(description: state.description.value),
      ),
    );
  }

  void _onCreateWorkoutPartConfirmed(
    CreateWorkoutPartConfirmed event,
    Emitter<CreateWorkoutState> emit,
  ) {
    var parts = state.wod.parts.toList();
    parts.add(event.part);
    final partsInput = WorkoutPartsInput.dirty(parts);
    final isValid = Formz.validate(
      [
        state.name,
        state.description,
        partsInput,
      ],
    );
    emit(
      state.copyWith(
        partsInput: partsInput,
        wod: state.wod.copyWith(parts: partsInput.value),
        status: isValid
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure,
      ),
    );
  }

  Future<void> _onCreateWorkoutConfirmed(
    CreateWorkoutConfirmed event,
    Emitter<CreateWorkoutState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _wodGeneratorRepository.createWorkout(wod: state.wod);
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (e) {
      addError(e, StackTrace.current);
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
