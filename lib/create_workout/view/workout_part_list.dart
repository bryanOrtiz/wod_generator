import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/create_workout/bloc/create_workout_bloc.dart';
import 'package:wod_generator/create_workout_part/create_workout_part.dart';

class WorkoutPartList extends StatelessWidget {
  const WorkoutPartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWorkoutBloc, CreateWorkoutState>(
      buildWhen: (previous, current) =>
          previous.workoutParts != current.workoutParts,
      builder: (context, state) {
        return Column(
          children: List.generate(state.workoutParts.length + 1, (index) {
            if (index == state.workoutParts.length) {
              return ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        CreateWorkoutPartPage.route(
                            context.read<CreateWorkoutBloc>()),
                      ),
                  child: const Text('Add Workout Part'));
            }
            final workoutPart = state.workoutParts[index];
            return InkWell(
              child: Card(
                child: ListTile(
                  title: Text(workoutPart.exercise!.name),
                  subtitle: Text(workoutPart.description()),
                ),
              ),
              onTap: () {
                print('This is where we will show edit mode');
              },
            );
          }),
        );
      },
    );
  }
}
