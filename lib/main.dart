import 'package:flutter/widgets.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';
import 'app.dart';

void main() {
  runApp(App(
    wodGeneratorRepository: WodGeneratorRepository(),
  ));
}
