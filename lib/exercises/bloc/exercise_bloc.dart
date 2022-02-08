import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wod_generator/exercises/models/models.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ExerciseBloc({required WodGeneratorRepository wodGeneratorRepository})
      : _wodGeneratorRepository = wodGeneratorRepository,
        super(const ExerciseState()) {
    on<ExerciseStepChanged>(_onStepChanged);
    on<ExerciseSearchTermChanged>(_onSearchTermChanged);
    on<ExerciseSearchSelected>(_onSelectedExercise);
    on<ExerciseNumberOfSetsChanged>(_onNumberOfSetsChanged);
    on<ExerciseGetInitialData>(_onGetInitialData);
    on<ExerciseSelectedWeightUnitChanged>(_onSelectedWeightUnitChanged);
  }

  final WodGeneratorRepository _wodGeneratorRepository;

  Future<void> _onSearchTermChanged(
    ExerciseSearchTermChanged event,
    Emitter<ExerciseState> emit,
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
    ExerciseSearchSelected event,
    Emitter<ExerciseState> emit,
  ) {
    emit(
      state.copyWith(
        selectedExercise: event.searchExercise,
      ),
    );
  }

  void _onNumberOfSetsChanged(
    ExerciseNumberOfSetsChanged event,
    Emitter<ExerciseState> emit,
  ) {
    final numOfSets = int.parse(event.numberOfSets);
    print('numOfSets: $numOfSets');
    emit(
      state.copyWith(
        numberOfSets: numOfSets, //int.parse(event.numberOfSets),
      ),
    );
  }

  Future<void> _onGetInitialData(
    ExerciseGetInitialData event,
    Emitter<ExerciseState> emit,
  ) async {
    final weightUnits = await _wodGeneratorRepository.getWeightUnits();
    emit(
      state.copyWith(
        weightUnits: weightUnits,
        selectedWeightUnit:
            weightUnits.firstWhere((element) => element.name.contains('lb')),
      ),
    );
  }

  Future<void> _onStepChanged(
    ExerciseStepChanged event,
    Emitter<ExerciseState> emit,
  ) async {
    emit(
      state.copyWith(
        step: event.step,
      ),
    );
  }

  Future<void> _onSelectedWeightUnitChanged(
    ExerciseSelectedWeightUnitChanged event,
    Emitter<ExerciseState> emit,
  ) async {
    final weightUnit =
        state.weightUnits.firstWhere((unit) => unit.name == event.weightUnit);
    emit(
      state.copyWith(
        selectedWeightUnit: weightUnit,
      ),
    );
  }
}
