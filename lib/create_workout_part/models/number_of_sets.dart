import 'package:formz/formz.dart';

enum NumberOfSetsValidationError { empty }

class NumberOfSets extends FormzInput<String, NumberOfSetsValidationError> {
  const NumberOfSets.pure() : super.pure('1');
  const NumberOfSets.dirty([String value = '']) : super.dirty(value);

  @override
  NumberOfSetsValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : NumberOfSetsValidationError.empty;
  }
}
