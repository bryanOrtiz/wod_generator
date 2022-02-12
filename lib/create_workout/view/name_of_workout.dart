import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/create_workout/bloc/create_workout_bloc.dart';

class NameOfWorkoutField extends StatelessWidget {
  const NameOfWorkoutField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWorkoutBloc, CreateWorkoutState>(
      buildWhen: (previous, current) =>
          previous.nameOfWorkout != current.nameOfWorkout,
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            labelText: 'Name of Workout',
          ),
          onChanged: (nameOfWorkout) => context.read<CreateWorkoutBloc>().add(
                CreateWorkoutNameChanged(nameOfWorkout),
              ),
        );
      },
    );
  }
}
