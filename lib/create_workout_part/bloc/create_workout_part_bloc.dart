import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wod_generator/create_workout_part/models/models.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

part 'create_workout_part_event.dart';
part 'create_workout_part_state.dart';

class CreateWorkoutPartBloc
    extends Bloc<CreateWorkoutPartEvent, CreateWorkoutPartState> {
  CreateWorkoutPartBloc(
      {required WodGeneratorRepository wodGeneratorRepository})
      : _wodGeneratorRepository = wodGeneratorRepository,
        super(const CreateWorkoutPartState()) {
    on<CreateWorkoutPartStepChanged>(_onStepChanged);
    on<CreateWorkoutPartSearchTermChanged>(_onSearchTermChanged);
    on<CreateWorkoutPartSearchSelected>(_onSelectedExercise);
    on<CreateWorkoutPartNumberOfSetsChanged>(_onNumberOfSetsChanged);
    on<CreateWorkoutPartGetInitialData>(_onGetInitialData);
    on<CreateWorkoutPartSelectedWeightUnitChanged>(
        _onSelectedWeightUnitChanged);
    on<CreateWorkoutPartCommentChanged>(_onCommentChanged);
    on<CreateWorkoutPartExerciseConfirmed>(_onSelectedExerciseConfirmed);
    on<CreateWorkoutPartCommentConfirmed>(_onCommentConfirmed);
    on<CreateWorkoutPartRepForSetChanged>(_onRepForSetChanged);
    on<CreateWorkoutPartRepForSetConfirmed>(_onRepForSetConfirmed);
  }

  final WodGeneratorRepository _wodGeneratorRepository;

  Future<void> _onSearchTermChanged(
    CreateWorkoutPartSearchTermChanged event,
    Emitter<CreateWorkoutPartState> emit,
  ) async {
    final searchTerm = SearchTerm.dirty(event.term);

    final exercises = await _wodGeneratorRepository.searchExerciseByTerm(
        term: searchTerm.value);
    emit(
      state.copyWith(
        searchTerm: searchTerm,
        exercises: exercises,
      ),
    );
  }

  void _onSelectedExercise(
    CreateWorkoutPartSearchSelected event,
    Emitter<CreateWorkoutPartState> emit,
  ) {
    emit(
      state.copyWith(
        selectedExercise: event.searchExercise,
      ),
    );
  }

  void _onSelectedExerciseConfirmed(
    CreateWorkoutPartExerciseConfirmed event,
    Emitter<CreateWorkoutPartState> emit,
  ) {
    emit(
      state.copyWith(
        part: state.part.copyWith(exercise: state.selectedExercise),
      ),
    );
  }

  void _onNumberOfSetsChanged(
    CreateWorkoutPartNumberOfSetsChanged event,
    Emitter<CreateWorkoutPartState> emit,
  ) {
    try {
      final numOfSets = int.parse(event.numberOfSets);
      final defaultSets = List.generate(
        numOfSets,
        (index) => const WorkoutSet(reps: 1),
      );
      emit(
        state.copyWith(
          sets: defaultSets,
          part: state.part.copyWith(sets: defaultSets),
        ),
      );
    } catch (e) {
      addError(e);
    }
  }

  Future<void> _onGetInitialData(
    CreateWorkoutPartGetInitialData event,
    Emitter<CreateWorkoutPartState> emit,
  ) async {
    final weightUnits = await _wodGeneratorRepository.getWeightUnits();
    final initialUnit =
        weightUnits.firstWhere((element) => element.name.contains('lb'));
    final initialUnitIndex =
        weightUnits.indexWhere((element) => element.name.contains('lb'));
    emit(
      state.copyWith(
        weightUnits: weightUnits,
        selectedWeightUnit: initialUnit,
        part: state.part.copyWith(weightUnit: initialUnitIndex),
      ),
    );
  }

  void _onStepChanged(
    CreateWorkoutPartStepChanged event,
    Emitter<CreateWorkoutPartState> emit,
  ) {
    emit(
      state.copyWith(
        step: event.step,
      ),
    );
  }

  void _onSelectedWeightUnitChanged(
    CreateWorkoutPartSelectedWeightUnitChanged event,
    Emitter<CreateWorkoutPartState> emit,
  ) {
    emit(
      state.copyWith(
        selectedWeightUnit: state.weightUnits
            .firstWhere((unit) => unit.name == event.weightUnit),
        part: state.part.copyWith(
          weightUnit: state.weightUnits
              .indexWhere((unit) => unit.name == event.weightUnit),
        ),
      ),
    );
  }

  void _onCommentChanged(
    CreateWorkoutPartCommentChanged event,
    Emitter<CreateWorkoutPartState> emit,
  ) {
    emit(
      state.copyWith(
        comment: event.comment,
      ),
    );
  }

  void _onCommentConfirmed(
    CreateWorkoutPartCommentConfirmed event,
    Emitter<CreateWorkoutPartState> emit,
  ) {
    emit(
      state.copyWith(
        part: state.part.copyWith(comment: state.comment),
      ),
    );
  }

  void _onRepForSetChanged(
    CreateWorkoutPartRepForSetChanged event,
    Emitter<CreateWorkoutPartState> emit,
  ) {
    try {
      var workoutSets = state.sets.toList();
      final target =
          workoutSets[event.set].copyWith(reps: int.parse(event.reps));
      workoutSets[event.set] = target;
      emit(
        state.copyWith(
          sets: workoutSets,
        ),
      );
    } catch (e) {
      addError(e);
    }
  }

  void _onRepForSetConfirmed(
    CreateWorkoutPartRepForSetConfirmed event,
    Emitter<CreateWorkoutPartState> emit,
  ) {
    emit(
      state.copyWith(
        part: state.part.copyWith(sets: state.sets),
      ),
    );
  }
}
