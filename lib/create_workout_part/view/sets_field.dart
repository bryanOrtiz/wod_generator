import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/create_workout_part/bloc/create_workout_part_bloc.dart';

class SetsField extends StatelessWidget {
  const SetsField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWorkoutPartBloc, CreateWorkoutPartState>(
      buildWhen: (previous, current) => previous.part.sets != current.part.sets,
      builder: (context, state) {
        return TextFormField(
            initialValue: state.part.sets.length.toString(),
            decoration: const InputDecoration(
              labelText: 'Number of Sets',
            ),
            keyboardType: TextInputType.number,
            onChanged: (numberOfSets) {
              context.read<CreateWorkoutPartBloc>().add(
                    CreateWorkoutPartNumberOfSetsChanged(numberOfSets),
                  );
            });
      },
    );
  }
}
