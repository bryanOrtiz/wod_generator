import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/exercises/bloc/exercise_bloc.dart';

class SetsField extends StatelessWidget {
  const SetsField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      buildWhen: (previous, current) =>
          previous.numberOfSets != current.numberOfSets,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.numberOfSets.toString(),
          decoration: const InputDecoration(
            labelText: 'Number of Sets',
          ),
          keyboardType: TextInputType.number,
          onChanged: (numberOfSets) => context.read<ExerciseBloc>().add(
                ExerciseNumberOfSetsChanged(numberOfSets),
              ),
        );
      },
    );
  }
}
