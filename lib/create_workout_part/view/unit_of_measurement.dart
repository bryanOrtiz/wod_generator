import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/create_workout_part/bloc/create_workout_part_bloc.dart';

class UnitOfMeasurement extends StatelessWidget {
  const UnitOfMeasurement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .read<CreateWorkoutPartBloc>()
        .add(const CreateWorkoutPartGetInitialData());
    return BlocBuilder<CreateWorkoutPartBloc, CreateWorkoutPartState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          value: state.selectedWeightUnit.name,
          items: state.weightUnits
              .map((unit) => DropdownMenuItem<String>(
                    value: unit.name,
                    child: Text(unit.name),
                  ))
              .toList(),
          onChanged: (selectedWeightUnit) {
            if (selectedWeightUnit != null) {
              context.read<CreateWorkoutPartBloc>().add(
                  CreateWorkoutPartSelectedWeightUnitChanged(
                      selectedWeightUnit));
            } else {}
          },
        );
      },
    );
  }
}
