import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/exercises/bloc/exercise_bloc.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

class SearchExercises extends StatelessWidget {
  const SearchExercises({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: BlocProvider(
        create: (context) => ExerciseBloc(
          wodGeneratorRepository: context.read<WodGeneratorRepository>(),
        ),
        child: Column(
          children: [
            _SearchField(),
            Expanded(
              child: _ExercisesListView(),
            ),
          ],
        ),
      ),
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
      buildWhen: (previous, current) => previous.exercises != current.exercises,
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.exercises.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(state.exercises[index].name),
            onTap: () => context.read<ExerciseBloc>().add(
                  ExerciseSearchSelected(
                    state.exercises[index],
                  ),
                ),
          ),
        );
      },
    );
  }
}
