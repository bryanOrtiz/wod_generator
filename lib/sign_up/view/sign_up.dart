import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:wod_generator/sign_in/view/sign_in_page.dart';
import 'package:wod_generator/sign_up/sign_up_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<SignUpBloc, SignUpState>(
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
                _SignUpButton(),
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
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
              icon: const Icon(
                Icons.person,
              ),
              labelText: 'Email',
              errorText: state.email.isNotValid ? 'invalid email' : null),
          onChanged: (emailTxt) => context.read<SignUpBloc>().add(
                SignUpEmailUpdated(
                  emailTxt: emailTxt,
                ),
              ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
              icon: const Icon(
                Icons.password,
              ),
              labelText: 'Password',
              errorText: state.email.isNotValid ? 'invalid email' : null),
          onChanged: (passwordTxt) => context.read<SignUpBloc>().add(
                SignUpPasswordUpdated(
                  passwordTxt: passwordTxt,
                ),
              ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () =>
                    context.read<SignUpBloc>().add(const SignUpSubmitted()),
                child: const Text('Sign Up'),
              );
      },
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.push(
        context,
        SignInPage.route(),
      ),
      child: const Text('Sign In'),
    );
  }
}
