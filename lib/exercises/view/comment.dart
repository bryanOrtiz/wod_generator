import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/exercises/bloc/exercise_bloc.dart';

class Comment extends StatelessWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        final exerciseBlocProvider = BlocProvider.of<ExerciseBloc>(context);
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return BlocProvider.value(
              value: exerciseBlocProvider,
              child: SafeArea(
                child: Column(
                  children: [
                    _CommentField(),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.table_rows),
      label: const Text('Expand'),
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
