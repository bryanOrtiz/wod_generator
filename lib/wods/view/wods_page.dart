import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/create_workout/create_workout.dart';
import 'package:wod_generator/edit_wod/view/edit_wod_page.dart';
import 'package:wod_generator/wods/bloc/wods_bloc.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

class WodsPage extends StatelessWidget {
  const WodsPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const WodsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WodsBloc(
        wodGeneratorRepository: context.read<WodGeneratorRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Wods')),
        body: BlocBuilder<WodsBloc, WodsState>(
          buildWhen: (previous, current) => previous.wods != current.wods,
          builder: (context, state) {
            return state.wods != null && state.wods!.isNotEmpty
                ? _WodsListView()
                : const _EmptyWods();
          },
        ),
      ),
    );
  }
}

class _WodsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WodsBloc, WodsState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.wods!.length,
                itemBuilder: (context, index) {
                  final wod = state.wods![index];
                  return Card(
                    child: InkWell(
                      child: ListTile(
                        title: Text(wod.name),
                        subtitle: Column(
                          children: List.generate(wod.parts.length, (index) {
                            final part = wod.parts[index];
                            return Column(
                              children: [
                                Text(part.exercise?.name ?? 'No exercise name'),
                                Text(part.description())
                              ],
                            );
                          }),
                        ),
                      ),
                      onTap: () =>
                          Navigator.of(context).push(EditWodPage.route(wod)),
                    ),
                  );
                },
              ),
            ),
            _BuildWodButton(),
          ],
        );
      },
    );
  }
}

class _EmptyWods extends StatelessWidget {
  const _EmptyWods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Let\'s Get Started',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          Text(
            'To get started we will need to generate your first Workout of the Day (WOD). Please click on the button below.',
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          _BuildWodButton(),
        ],
      ),
    );
  }
}

class _BuildWodButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.onBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                CreateWorkoutPage.route(),
              );
            },
            child: const Text('Build WOD'),
          ),
        ),
      ),
    );
  }
}
