import 'package:formz/formz.dart';

enum SearchTermValidationError { empty }

class SearchTerm extends FormzInput<String, SearchTermValidationError> {
  const SearchTerm.pure() : super.pure('');
  const SearchTerm.dirty([String value = '']) : super.dirty(value);

  @override
  SearchTermValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : SearchTermValidationError.empty;
  }
}
