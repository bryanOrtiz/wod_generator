import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:wod_generator/create_workout/bloc/create_workout_bloc.dart';
import 'package:wod_generator/create_workout/view/confirm_create_workout_sheet.dart';
import 'package:wod_generator/create_workout/view/create_workout_error.dart';
import 'package:wod_generator/create_workout/view/description_of_workout.dart';
import 'package:wod_generator/create_workout/view/workout_part_list.dart';
import 'package:wod_generator/create_workout/view/name_of_workout.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

class CreateWorkoutPage extends StatelessWidget {
  const CreateWorkoutPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const CreateWorkoutPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Workout'),
      ),
      body: BlocProvider(
        create: (context) => CreateWorkoutBloc(
          wodGeneratorRepository: context.read<WodGeneratorRepository>(),
        ),
        child: BlocBuilder<CreateWorkoutBloc, CreateWorkoutState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: Stepper(
                    currentStep: state.step,
                    onStepTapped: (value) => context
                        .read<CreateWorkoutBloc>()
                        .add(CreateWorkoutStepChanged(value)),
                    onStepContinue: () {
                      final nextStep = state.step + 1;
                      context
                          .read<CreateWorkoutBloc>()
                          .add(CreateWorkoutStepChanged(nextStep));
                    },
                    onStepCancel: () {
                      if (state.step > 0) {
                        context
                            .read<CreateWorkoutBloc>()
                            .add(CreateWorkoutStepChanged(state.step - 1));
                      }
                    },
                    steps: const [
                      Step(
                        title: Text('Name Workout'),
                        content: NameOfWorkoutField(),
                      ),
                      Step(
                        title: Text('Description'),
                        content: WorkoutDescription(),
                      ),
                      Step(
                        title: Text('Parts'),
                        content: WorkoutPartList(),
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: ElevatedButton(
                    onPressed: () {
                      final createWorkoutBlocProvider =
                          BlocProvider.of<CreateWorkoutBloc>(context);
                      if (!state.status.isValid) {
                        showDialog(
                          context: context,
                          builder: (context) => CreateWorkoutError(
                            bloc: createWorkoutBlocProvider,
                          ),
                        );
                        return;
                      }
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ConfirmCreateWorkoutSheet(
                              bloc: createWorkoutBlocProvider);
                        },
                      );
                    },
                    child: const Text('Confirm'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
