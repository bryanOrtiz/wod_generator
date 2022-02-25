import 'package:formz/formz.dart';

enum WorkoutDescriptionValidationError { empty }

class WorkoutDescription
    extends FormzInput<String, WorkoutDescriptionValidationError> {
  const WorkoutDescription.pure() : super.pure('');
  const WorkoutDescription.dirty({String value = ''}) : super.dirty(value);

  @override
  WorkoutDescriptionValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : WorkoutDescriptionValidationError.empty;
  }
}
