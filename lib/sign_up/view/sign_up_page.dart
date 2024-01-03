import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_api/firebase_auth_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wod_generator/sign_up/sign_up_bloc.dart';
import 'package:wod_generator/sign_up/view/sign_up.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignUp')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return SignUpBloc(
              firebaseAuthApi: FirebaseAuthApi(
                firebaseAuth: FirebaseAuth.instance,
                googleSignIn: GoogleSignIn.standard(),
              ),
            );
          },
          child: const SignUp(),
        ),
      ),
    );
  }
}
