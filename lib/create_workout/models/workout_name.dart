import 'package:formz/formz.dart';

enum WorkoutNameValidationError { empty }

class WorkoutName extends FormzInput<String, WorkoutNameValidationError> {
  const WorkoutName.pure() : super.pure('');
  const WorkoutName.dirty([String value = '']) : super.dirty(value);

  @override
  WorkoutNameValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : WorkoutNameValidationError.empty;
  }
}
