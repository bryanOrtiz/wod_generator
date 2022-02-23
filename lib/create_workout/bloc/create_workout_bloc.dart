import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:wod_generator/create_workout/bloc/models/models.dart';
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
    emit(
      state.copyWith(
        name: name,
        wod: state.wod.copyWith(name: name.value),
        status: Formz.validate(
          [
            name,
            state.description,
          ],
        ),
      ),
    );
  }

  void _onDescriptionChanged(
    CreateWorkoutDescriptionChanged event,
    Emitter<CreateWorkoutState> emit,
  ) {
    final description = WorkoutDescription.dirty(event.description);
    emit(
      state.copyWith(
        description: description,
        status: Formz.validate(
          [
            state.name,
            description,
          ],
        ),
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
    emit(
      state.copyWith(
        wod: state.wod.copyWith(parts: parts),
      ),
    );
  }

  Future<void> _onCreateWorkoutConfirmed(
    CreateWorkoutConfirmed event,
    Emitter<CreateWorkoutState> emit,
  ) async {
    await _wodGeneratorRepository.createWorkout(wod: state.wod);
  }
}
