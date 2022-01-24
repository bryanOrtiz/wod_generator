import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/sign_in_bloc.dart';

import 'form_state.dart' as formState;

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Form(
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
      );
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
              icon: Icon(
                Icons.person,
              ),
              labelText: 'Email'),
          onChanged: (username) =>
              context.read<SignInBloc>().add(SignInUsernameChanged(username)),
          validator: (value) =>
              value != null && value.isNotEmpty ? 'Invalid' : null,
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
          decoration: const InputDecoration(
              icon: Icon(
                Icons.password,
              ),
              labelText: 'Password'),
          onChanged: (password) =>
              context.read<SignInBloc>().add(SignInPasswordChanged(password)),
          validator: (value) =>
              value != null && value.isNotEmpty ? 'Invalid' : null,
        );
      },
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) => previous.formState != current.formState,
      builder: (context, state) {
        return state.formState == formState.FormState.progress
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
