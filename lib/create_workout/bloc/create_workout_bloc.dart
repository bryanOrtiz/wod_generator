import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wod_generator/create_workout_part/models/models.dart';
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
    on<CreateWorkoutPartConfirmed>(_onCreateWorkoutPartConfirmed);
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
    emit(
      state.copyWith(
        nameOfWorkout: event.name,
      ),
    );
  }

  void _onDescriptionChanged(
    CreateWorkoutDescriptionChanged event,
    Emitter<CreateWorkoutState> emit,
  ) {
    emit(
      state.copyWith(
        description: event.description,
      ),
    );
  }

  void _onCreateWorkoutPartConfirmed(
    CreateWorkoutPartConfirmed event,
    Emitter<CreateWorkoutState> emit,
  ) {
    var parts = state.workoutParts.toList();
    parts.add(event.part);
    emit(
      state.copyWith(
        workoutParts: parts,
      ),
    );
  }
}
