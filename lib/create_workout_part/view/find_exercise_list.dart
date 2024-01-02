import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/create_workout_part/bloc/create_workout_part_bloc.dart';

class FindExerciseList extends StatelessWidget {
  const FindExerciseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: BlocBuilder<CreateWorkoutPartBloc, CreateWorkoutPartState>(
            buildWhen: (previous, current) =>
                previous.part.exercise != current.part.exercise,
            builder: (context, state) {
              return ListTile(
                title: Text(
                  'Selected Exercise:',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text(
                  state.part.exercise != null
                      ? state.part.exercise!.name
                      : 'Click here to find exercise',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: const Icon(Icons.unfold_more),
              );
            }),
        onTap: () {
          final exerciseBlocProvider =
              BlocProvider.of<CreateWorkoutPartBloc>(context);
          showModalBottomSheet(
            context: context,
            builder: (context) => _BottomSheet(bloc: exerciseBlocProvider),
          );
        },
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({Key? key, required this.bloc}) : super(key: key);
  final CreateWorkoutPartBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: SafeArea(
        child: Column(
          children: [
            _SearchField(),
            _ExercisesListView(),
            ElevatedButton(
              onPressed: () {
                bloc.add(const CreateWorkoutPartExerciseConfirmed());
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
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
    return BlocBuilder<CreateWorkoutPartBloc, CreateWorkoutPartState>(
      buildWhen: (previous, current) =>
          previous.searchTerm != current.searchTerm,
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.search),
            labelText: 'Search',
          ),
          onChanged: (searchTerm) => context.read<CreateWorkoutPartBloc>().add(
                CreateWorkoutPartSearchTermChanged(searchTerm),
              ),
        );
      },
    );
  }
}

class _ExercisesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWorkoutPartBloc, CreateWorkoutPartState>(
      buildWhen: (previous, current) =>
          previous.exercises != current.exercises ||
          previous.selectedExercise != current.selectedExercise,
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.exercises.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(state.exercises[index].name),
              onTap: () => context.read<CreateWorkoutPartBloc>().add(
                    CreateWorkoutPartSearchSelected(
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
