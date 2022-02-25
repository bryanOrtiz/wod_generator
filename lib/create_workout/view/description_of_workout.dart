import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/create_workout/bloc/create_workout_bloc.dart';

class WorkoutDescription extends StatelessWidget {
  const WorkoutDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: BlocBuilder<CreateWorkoutBloc, CreateWorkoutState>(
          buildWhen: (previous, current) =>
              previous.wod.description != current.wod.description,
          builder: (context, state) {
            return ListTile(
              title: Text(
                'Description',
                style: Theme.of(context).textTheme.caption,
              ),
              subtitle: Text(
                state.wod.description.isNotEmpty
                    ? state.wod.description
                    : 'Leave a brief description about the workout and what goals should be attained.',
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.unfold_more),
            );
          },
        ),
        onTap: () {
          final createWorkoutBlocProvider =
              BlocProvider.of<CreateWorkoutBloc>(context);
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return _BottomSheet(bloc: createWorkoutBlocProvider);
            },
          );
        },
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({Key? key, required this.bloc}) : super(key: key);
  final CreateWorkoutBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: SafeArea(
        child: Column(
          children: [
            _DescriptionField(),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                bloc.add(const CreateWorkoutDescriptionConfirmed());
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

class _DescriptionField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWorkoutBloc, CreateWorkoutState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            initialValue: state.wod.description,
            minLines: 1,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              hintText:
                  'Leave a brief description about the workout and what goals should be attained.',
            ),
            onChanged: (description) => context.read<CreateWorkoutBloc>().add(
                  CreateWorkoutDescriptionChanged(description),
                ),
          ),
        );
      },
    );
  }
}
