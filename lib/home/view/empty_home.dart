import 'package:flutter/material.dart';
import 'package:wod_generator/create_workout/view/create_workout_page.dart';

class EmptyHome extends StatelessWidget {
  const EmptyHome({Key? key}) : super(key: key);

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
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CreateWorkoutPage.route(),
                );
              },
              child: const Text('Build WOD'))
        ],
      ),
    );
  }
}
