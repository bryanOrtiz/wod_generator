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
    on<ExerciseSearchTermChanged>(_onSearchTermChanged);
    on<ExerciseSearchSelected>(_onSelectedExercise);
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
}
