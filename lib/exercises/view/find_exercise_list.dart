import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/exercises/bloc/exercise_bloc.dart';

class FindExerciseList extends StatelessWidget {
  const FindExerciseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        return ElevatedButton.icon(
          onPressed: () {
            final exerciseBlocProvider = BlocProvider.of<ExerciseBloc>(context);
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return BlocProvider.value(
                  value: exerciseBlocProvider,
                  child: SafeArea(
                    child: Column(
                      children: [
                        _SearchField(),
                        _ExercisesListView(),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          icon: const Icon(Icons.fitness_center),
          label: Text(
            state.selectedExercise != null
                ? state.selectedExercise!.name
                : 'Find Your Exercise',
          ),
        );
      },
    );
  }
}

class _SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      buildWhen: (previous, current) =>
          previous.searchTerm != current.searchTerm,
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.search),
            labelText: 'Search',
          ),
          onChanged: (searchTerm) => context.read<ExerciseBloc>().add(
                ExerciseSearchTermChanged(searchTerm),
              ),
        );
      },
    );
  }
}

class _ExercisesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      buildWhen: (previous, current) =>
          previous.exercises != current.exercises ||
          previous.selectedExercise != current.selectedExercise,
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.exercises.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(state.exercises[index].name),
              onTap: () => context.read<ExerciseBloc>().add(
                    ExerciseSearchSelected(
                      state.exercises[index],
                    ),
                  ),
              selected: state.selectedExercise != null &&
                  state.exercises[index].name == state.selectedExercise!.name,
            ),
          ),
        );
      },
    );
  }
}
