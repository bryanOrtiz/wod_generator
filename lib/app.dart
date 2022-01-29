import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/home/view/home_page.dart';
import 'package:wod_generator/sign_in/view/sign_in_page.dart';
import 'package:wod_generator/splash/view/splash_page.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

import 'authentication/bloc/authentication_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.wodGeneratorRepository,
  }) : super(key: key);

  final WodGeneratorRepository wodGeneratorRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: wodGeneratorRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          wodGeneratorRepository: wodGeneratorRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  SignInPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
