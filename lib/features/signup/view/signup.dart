import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

import '../../../l10n/l10n.dart';
import '../cubit/sign_up_cubit.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const Signup());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.signupPageName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider<SignupCubit>(
          create: (_) => SignupCubit(context.read<AuthRepository>()),
          child: const _SignupForm(key: Key('signup_form')),
        ),
      ),
    );
  }
}

class _SignupForm extends StatelessWidget {
  const _SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isSubmissionFailure &&
            state.exception != null) {
          String errorMessage;
          switch (state.exception!.failure) {
            case SignupFailure.userAlreadyExists:
              errorMessage = l10n.emailAlreadyInUse;
              break;
            case SignupFailure.unknown:
              errorMessage = l10n.unknownError;
              break;
          }
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(errorMessage),
              ),
            );
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: constraints.maxWidth < 500
              ? const EdgeInsets.all(10)
              : const EdgeInsets.all(50),
          child: SingleChildScrollView(
            child: Center(
              heightFactor: 1.5,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    const _NameInput(
                      key: Key('signupForm_nameInput'),
                    ),
                    const SizedBox(height: 8),
                    const _EmailInput(
                      key: Key('signupForm_emailInput'),
                    ),
                    const SizedBox(height: 8),
                    const _PasswordInput(
                      key: Key('signupForm_passwordInput'),
                    ),
                    const SizedBox(height: 8),
                    const _ConfirmPasswordInput(
                      key: Key('signupForm_confirmPasswordInput'),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: constraints.maxWidth < 500
                          ? const EdgeInsets.symmetric(horizontal: 70)
                          : const EdgeInsets.symmetric(horizontal: 90),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          _SignupButton(
                            key: Key('signupForm_continue_raisedButton'),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SignupButton extends StatelessWidget {
  const _SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SubmitButton(
                key: key,
                onPressed: state.email.valid && state.password.valid
                    ? () => context.read<SignupCubit>().signUpFormSubmitted()
                    : null,
                label: l10n.signUpButtonLabel,
              );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return PasswordInput(
          key: key,
          onChanged: (password) =>
              context.read<SignupCubit>().passwordChanged(password),
          labelText: l10n.passwordInputLabel,
          helperText: '',
          errorText: state.password.invalid ? l10n.passwordInvalidText : null,
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return PasswordInput(
          key: key,
          onChanged: (password) =>
              context.read<SignupCubit>().confirmedPasswordChanged(password),
          labelText: l10n.confirmPasswordInputLabel,
          helperText: '',
          errorText: state.confirmedPassword.invalid
              ? l10n.confirmPasswordInvalid
              : null,
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return EmailInput(
          key: key,
          onChanged: (email) => context.read<SignupCubit>().emailChanged(email),
          labelText: l10n.emailInputLabel,
          helperText: '',
          errorText: state.email.invalid ? l10n.emailInvalidText : null,
        );
      },
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return NameInput(
          key: key,
          onChanged: (name) => context.read<SignupCubit>().nameChanged(name),
          labelText: l10n.nameInputLabel,
          helperText: '',
          errorText: state.name.invalid ? l10n.nameInvalidText : null,
        );
      },
    );
  }
}
