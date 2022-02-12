import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/create_workout/bloc/create_workout_bloc.dart';
import 'package:wod_generator/create_workout_part/bloc/create_workout_part_bloc.dart';
import 'package:wod_generator/create_workout_part/view/comment.dart';
import 'package:wod_generator/create_workout_part/view/find_exercise_list.dart';
import 'package:wod_generator/create_workout_part/view/reps_per_set.dart';
import 'package:wod_generator/create_workout_part/view/sets_field.dart';
import 'package:wod_generator/create_workout_part/view/unit_of_measurement.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

class CreateWorkoutPartPage extends StatelessWidget {
  const CreateWorkoutPartPage({Key? key}) : super(key: key);

  static Route route(CreateWorkoutBloc bloc) {
    return MaterialPageRoute<void>(builder: (context) {
      return BlocProvider.value(
        value: bloc,
        child: const CreateWorkoutPartPage(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Part'),
      ),
      body: BlocProvider(
        create: (context) => CreateWorkoutPartBloc(
          wodGeneratorRepository: context.read<WodGeneratorRepository>(),
        ),
        child: BlocBuilder<CreateWorkoutPartBloc, CreateWorkoutPartState>(
          builder: (context, state) {
            return Column(
              children: [
                Stepper(
                  currentStep: state.step,
                  onStepTapped: (value) => context
                      .read<CreateWorkoutPartBloc>()
                      .add(CreateWorkoutPartStepChanged(value)),
                  onStepContinue: () {
                    final nextStep = state.step + 1;
                    context
                        .read<CreateWorkoutPartBloc>()
                        .add(CreateWorkoutPartStepChanged(nextStep));
                  },
                  onStepCancel: () {
                    if (state.step > 0) {
                      context
                          .read<CreateWorkoutPartBloc>()
                          .add(CreateWorkoutPartStepChanged(state.step - 1));
                    }
                  },
                  steps: const [
                    Step(
                      title: Text('Find Exercise'),
                      content: FindExerciseList(),
                    ),
                    Step(
                      title: Text('What is your unit of measurement?'),
                      content: UnitOfMeasurement(),
                    ),
                    Step(
                      title: Text('How many sets?'),
                      content: SetsField(),
                    ),
                    Step(
                      title: Text('How many reps per set?'),
                      content: RepsPerSet(),
                    ),
                    Step(
                      title: Text('Comment'),
                      content: Comment(),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<CreateWorkoutBloc>()
                          .add(CreateWorkoutPartConfirmed(state.part));
                      Navigator.of(context).pop();
                    },
                    child: const Text('Confirm')),
              ],
            );
          },
        ),
      ),
    );
  }
}
