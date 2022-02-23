import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/create_workout/bloc/create_workout_bloc.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';
import 'package:formz/formz.dart';

class ConfirmCreateWorkoutSheet extends StatelessWidget {
  const ConfirmCreateWorkoutSheet({Key? key, required this.bloc})
      : super(key: key);
  final CreateWorkoutBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: SafeArea(
        child: BlocListener<CreateWorkoutBloc, CreateWorkoutState>(
          listener: (context, state) {
            if (state.status.isSubmissionSuccess) {
              Navigator.of(context).popUntil((route) => route.isFirst);
            }
            // TODO: implement listener for errors
          },
          child: Column(
            children: [
              Expanded(
                child: _WorkoutListView(),
              ),
              _SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _WorkoutListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<CreateWorkoutBloc, CreateWorkoutState>(
        builder: (context, state) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 4,
            itemBuilder: (context, index) {
              final theme = Theme.of(context);
              switch (index) {
                case 0:
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'Are you sure you want to create the following workout?',
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  );
                case 1:
                  return ListTile(
                    title: Text(
                      'Name',
                      style: theme.textTheme.subtitle1,
                    ),
                    subtitle: Text(
                      state.wod.name,
                      style: theme.textTheme.bodyText1,
                    ),
                  );
                case 2:
                  return ListTile(
                    title: Text(
                      'Description',
                      style: theme.textTheme.subtitle1,
                    ),
                    subtitle: Text(
                      state.wod.description,
                      style: theme.textTheme.bodyText1,
                    ),
                  );
                case 3:
                  return _WorkoutPartListView();
                default:
                  return const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}

class _WorkoutPartListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(
        'Parts',
        style: theme.textTheme.subtitle1,
      ),
      subtitle: BlocBuilder<CreateWorkoutBloc, CreateWorkoutState>(
        builder: (context, state) {
          return Column(
            children: List.generate(
              state.wod.parts.length,
              (index) {
                final workoutPart = state.wod.parts[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        workoutPart.exercise!.name,
                        style: theme.textTheme.subtitle2,
                      ),
                      subtitle: Text(
                        workoutPart.description(),
                        style: theme.textTheme.bodyText2,
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWorkoutBloc, CreateWorkoutState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () => context
              .read<CreateWorkoutBloc>()
              .add(const CreateWorkoutConfirmed()),
          child: (state.status.isSubmissionInProgress)
              ? SizedBox.square(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  dimension: 24,
                )
              : const Text('Submit'),
        );
      },
    );
  }
}
