import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/exercises/bloc/exercise_bloc.dart';

class Comment extends StatelessWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            return ListTile(
              title: Text(
                'Comment',
                style: Theme.of(context).textTheme.caption,
              ),
              subtitle: Text(
                'Placeholder',
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
            _CommentField(),
            const Spacer(),
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

class _CommentField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            minLines: 1,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText:
                  'Leave a comment explaining exercise and how sets should be done.',
            ),
            onChanged: (searchTerm) => context.read<ExerciseBloc>().add(
                  ExerciseSearchTermChanged(searchTerm),
                ),
          ),
        );
      },
    );
  }
}
