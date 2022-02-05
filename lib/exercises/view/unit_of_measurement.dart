import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/exercises/bloc/exercise_bloc.dart';

class UnitOfMeasurement extends StatelessWidget {
  const UnitOfMeasurement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ExerciseBloc>().add(const ExerciseGetInitialData());
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          items: state.weightUnits
              .map((unit) => DropdownMenuItem<String>(
                    child: Text(unit.name),
                    value: unit.name,
                  ))
              .toList(),
          onChanged: (value) {
            print(value);
          },
        );
      },
    );
  }
}
