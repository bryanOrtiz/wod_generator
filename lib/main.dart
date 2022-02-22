import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';
import 'app.dart';
import '../firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(App(
    wodGeneratorRepository: WodGeneratorRepository(),
  ));
}
