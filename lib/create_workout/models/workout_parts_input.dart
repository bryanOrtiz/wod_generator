import 'package:formz/formz.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

enum WorkoutPartsInputValidationError { empty }

class WorkoutPartsInput
    extends FormzInput<List<WorkoutPart>, WorkoutPartsInputValidationError> {
  const WorkoutPartsInput.pure() : super.pure(const []);
  const WorkoutPartsInput.dirty([List<WorkoutPart> value = const []])
      : super.dirty(value);

  @override
  WorkoutPartsInputValidationError? validator(List<WorkoutPart>? value) {
    return value?.isNotEmpty == true
        ? null
        : WorkoutPartsInputValidationError.empty;
  }
}
