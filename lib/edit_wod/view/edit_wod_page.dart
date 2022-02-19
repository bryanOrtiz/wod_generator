import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';
import 'package:wod_generator/edit_wod/bloc/edit_wod_bloc.dart';

class EditWodPage extends StatelessWidget {
  const EditWodPage({
    Key? key,
    required Wod initialWod,
  })  : _initialWod = initialWod,
        super(key: key);

  static Route route(Wod initialWod) {
    return MaterialPageRoute<void>(
        builder: (_) => EditWodPage(
              initialWod: initialWod,
            ));
  }

  final Wod _initialWod;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return BlocProvider(
      create: (context) => EditWodBloc(
        wod: _initialWod,
        wodGeneratorRepository: context.read<WodGeneratorRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Wod'),
          actions: [
            BlocBuilder<EditWodBloc, EditWodState>(
              builder: (context, state) {
                return TextButton(
                  style: style,
                  onPressed: () {
                    context.read<EditWodBloc>().add(!state.isEditable
                        ? const EditWodEditToggled()
                        : const EditWodUpdateToggled());
                  },
                  child: Text(!state.isEditable ? 'Edit' : 'Update'),
                );
              },
            )
          ],
        ),
        body: SafeArea(
          child: BlocListener<EditWodBloc, EditWodState>(
            listener: (context, state) {
              if (state.isDeleted) {
                Navigator.of(context).pop();
              }
            },
            child: Column(
              children: [
                Expanded(
                  child: _WorkoutListView(),
                ),
              ],
            ),
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
      child: BlocBuilder<EditWodBloc, EditWodState>(
        builder: (context, state) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 4,
            itemBuilder: (context, index) {
              final theme = Theme.of(context);
              switch (index) {
                case 0:
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
                case 1:
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
                case 2:
                  return _WorkoutPartListView();
                case 3:
                  return TextButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            theme.colorScheme.error)),
                    onPressed: () =>
                        context.read<EditWodBloc>().add(const EditWodDelete()),
                    child: const Text('Delete'),
                  );
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
      subtitle: BlocBuilder<EditWodBloc, EditWodState>(
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
