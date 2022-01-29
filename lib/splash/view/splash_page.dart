import 'package:flutter/material.dart';
import 'package:wod_generator/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    context.read<AuthenticationBloc>().add(AuthenticationUncacheLastSession());
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
