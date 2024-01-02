import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/create_workout_part/bloc/create_workout_part_bloc.dart';

class Comment extends StatelessWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: BlocBuilder<CreateWorkoutPartBloc, CreateWorkoutPartState>(
          builder: (context, state) {
            return ListTile(
              title: Text(
                'Comment',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text(
                state.part.comment.isNotEmpty
                    ? state.part.comment
                    : 'Leave a comment explaining exercise and how sets should be done.',
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.unfold_more),
            );
          },
        ),
        onTap: () {
          final exerciseBlocProvider =
              BlocProvider.of<CreateWorkoutPartBloc>(context);
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
  final CreateWorkoutPartBloc bloc;

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
              onPressed: () {
                bloc.add(const CreateWorkoutPartCommentConfirmed());
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

class _CommentField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWorkoutPartBloc, CreateWorkoutPartState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            initialValue: state.part.comment,
            minLines: 1,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText:
                  'Leave a comment explaining exercise and how sets should be done.',
            ),
            onChanged: (comment) => context.read<CreateWorkoutPartBloc>().add(
                  CreateWorkoutPartCommentChanged(comment),
                ),
          ),
        );
      },
    );
  }
}
