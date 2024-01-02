import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:wod_generator/sign_in/bloc/sign_in_bloc.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Authentication Failure'),
                ),
              );
          }
        },
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Spacer(),
                _EmailInput(),
                _PasswordInput(),
                const Spacer(
                  flex: 2,
                ),
                _SignInButton(),
                const Spacer()
              ],
            ),
          ),
        ),
      );
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
              icon: const Icon(
                Icons.person,
              ),
              labelText: 'Email',
              errorText: state.email.isNotValid ? 'invalid email' : null),
          onChanged: (username) =>
              context.read<SignInBloc>().add(SignInEmailChanged(username)),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
              icon: const Icon(
                Icons.password,
              ),
              labelText: 'Password',
              errorText: state.email.isNotValid ? 'invalid email' : null),
          onChanged: (password) =>
              context.read<SignInBloc>().add(SignInPasswordChanged(password)),
        );
      },
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () =>
                    context.read<SignInBloc>().add(const SignInSubmitted()),
                child: const Text('Sign In'),
              );
      },
    );
  }
}
