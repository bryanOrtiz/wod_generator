import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/sign_in/bloc/sign_in_bloc.dart';
import 'package:wod_generator/sign_in/view/sign_in.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignInPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return SignInBloc(
              wodGeneratorRepository:
                  RepositoryProvider.of<WodGeneratorRepository>(context),
            );
          },
          child: const SignIn(),
        ),
      ),
    );
  }
}
