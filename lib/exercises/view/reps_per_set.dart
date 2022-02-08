import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/exercises/bloc/exercise_bloc.dart';

class RepsPerSet extends StatelessWidget {
  const RepsPerSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            return ListTile(
              title: Text(
                'Reps',
                style: Theme.of(context).textTheme.caption,
              ),
              subtitle: Text(
                '1x1',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: const Icon(Icons.unfold_more),
            );
          },
        ),
        onTap: () {
          final exerciseBlocProvider = BlocProvider.of<ExerciseBloc>(context);
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return _BottomSheet(bloc: exerciseBlocProvider);
            },
          );
        },
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({Key? key, required this.bloc}) : super(key: key);
  final ExerciseBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'For each set please mark the number of reps for the sets.',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
            _NumberOfRepsRows(),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NumberOfRepsRows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      buildWhen: (previous, current) =>
          previous.numberOfSets != current.numberOfSets,
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.numberOfSets,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text('Set ${index + 1}'),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (reps) => print(reps),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
