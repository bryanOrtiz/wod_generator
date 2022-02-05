import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/exercises/bloc/exercise_bloc.dart';
import 'package:wod_generator/exercises/view/comment.dart';
import 'package:wod_generator/exercises/view/find_exercise_list.dart';
import 'package:wod_generator/exercises/view/reps_per_set.dart';
import 'package:wod_generator/exercises/view/sets_field.dart';
import 'package:wod_generator/exercises/view/unit_of_measurement.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

class CreateExercisePage extends StatelessWidget {
  const CreateExercisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Builder'),
      ),
      body: BlocProvider(
        create: (context) => ExerciseBloc(
          wodGeneratorRepository: context.read<WodGeneratorRepository>(),
        ),
        child: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            return Stepper(
              currentStep: state.step,
              onStepTapped: (value) =>
                  context.read<ExerciseBloc>().add(ExerciseStepChanged(value)),
              onStepContinue: () {
                final nextStep = state.step + 1;
                context.read<ExerciseBloc>().add(ExerciseStepChanged(nextStep));
              },
              onStepCancel: () {
                if (state.step > 0) {
                  context
                      .read<ExerciseBloc>()
                      .add(ExerciseStepChanged(state.step - 1));
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
            );
          },
        ),
      ),
    );
  }
}
