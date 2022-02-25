import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';
import 'package:wod_generator/edit_wod/bloc/edit_wod_bloc.dart';
import 'package:formz/formz.dart';

part 'name_text_field.dart';
part 'description_text_field.dart';
part 'workout_part_list_view.dart';
part 'delete_button.dart';
part 'update_button.dart';

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
    return BlocProvider(
      create: (context) => EditWodBloc(
        wod: _initialWod,
        wodGeneratorRepository: context.read<WodGeneratorRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Wod'),
          actions: [
            _UpdateButton(),
          ],
        ),
        body: SafeArea(
          child: BlocListener<EditWodBloc, EditWodState>(
            listener: (context, state) {
              if (state.deleteStatus.isSubmissionSuccess) {
                Navigator.of(context).pop();
              }
            },
            child: _WorkoutListView(),
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
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return _NameTextField();
            case 1:
              return _DescriptionTextField();
            case 2:
              return _WorkoutPartListView();
            case 3:
              return _DeleteButton();
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
