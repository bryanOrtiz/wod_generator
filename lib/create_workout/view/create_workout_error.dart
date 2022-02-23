import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/create_workout/bloc/create_workout_bloc.dart';
import 'package:wod_generator/create_workout/bloc/models/workout_description.dart';
import 'package:wod_generator/create_workout/bloc/models/workout_name.dart';

class CreateWorkoutError extends StatelessWidget {
  const CreateWorkoutError({Key? key, required this.bloc}) : super(key: key);

  final CreateWorkoutBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: AlertDialog(
        title: _Title(),
        content: _Content(),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Dismiss'))
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWorkoutBloc, CreateWorkoutState>(
      builder: (context, state) {
        if (state.name.error != null) {
          return const Text('The name field is invalid');
        }
        if (state.description.error != null) {
          return const Text('The description field is invalid');
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWorkoutBloc, CreateWorkoutState>(
      builder: (context, state) {
        if (state.name.error != null &&
            state.name.error! == WorkoutNameValidationError.empty) {
          return const Text(
              'You must enter a name of the workout in order to continue.');
        }
        if (state.description.error != null &&
            state.description.error! ==
                WorkoutDescriptionValidationError.empty) {
          return const Text(
              'You must enter a description of the workout in order to continue.');
        }
        return const SizedBox.shrink();
      },
    );
  }
}
