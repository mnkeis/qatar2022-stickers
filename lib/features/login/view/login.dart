import 'dart:io';

import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

import '../../../features/login/cubit/login_cubit.dart';
import '../../../features/signup/view/signup.dart';
import '../../../l10n/l10n.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static Page<void> page() => const MaterialPage<void>(child: Login());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.loginPageName)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthRepository>()),
          child: const _LoginForm(key: Key('login-form')),
        ),
      ),
    );
  }
}

/// Login form widget
class _LoginForm extends StatelessWidget {
  /// Displays the login form
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure && state.exception != null) {
          String errorMessage;
          switch (state.exception!.failure) {
            case LoginFailure.invalidPassword:
            case LoginFailure.userNotFound:
              errorMessage = l10n.userNotFoundOrWrongPassword;
              break;
            case LoginFailure.unknown:
              errorMessage = l10n.unknownError;
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
                    const _EmailInput(
                      key: Key('loginForm_emailInput'),
                    ),
                    const SizedBox(height: 8),
                    const _PasswordInput(
                      key: Key('loginForm_passwordInput'),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: constraints.maxWidth < 500
                          ? const EdgeInsets.symmetric(horizontal: 70)
                          : const EdgeInsets.symmetric(horizontal: 90),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const _LoginButton(
                            key: Key('loginForm_continue_raisedButton'),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          GoogleLoginButton(
                            key:
                                const Key('loginForm_googleLogin_raisedButton'),
                            label: l10n.loginWithGoogleButtonLabel,
                            icon: Image.asset(
                              'assets/google.png',
                              height: 48,
                            ),
                            onPressed:
                                context.read<LoginCubit>().logInWithGoogle,
                          ),
                          const SizedBox(height: 16),
                          if (!kIsWeb)
                            if (Platform.isIOS) ...[
                              AppleLoginButton(
                                label: l10n.loginWithAppleButtonLabel,
                                onPressed:
                                    context.read<LoginCubit>().logInWithApple,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                            ],
                        ],
                      ),
                    ),
                    SignUpButton(
                      key: const Key('loginForm_createAccount_flatButton'),
                      onPressed: () =>
                          Navigator.of(context).push<void>(Signup.route()),
                      label: l10n.createAccountButtonLabel,
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

class _LoginButton extends StatelessWidget {
  const _LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SubmitButton(
                key: const Key(
                  'loginForm_continue_raisedButton',
                ),
                onPressed: state.email.valid && state.password.valid
                    ? () => context.read<LoginCubit>().logInWithCredentials()
                    : null,
                label: l10n.loginButtonLabel,
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
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return PasswordInput(
          key: key,
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          labelText: l10n.passwordInputLabel,
          helperText: '',
          errorText: state.password.invalid ? l10n.passwordInvalidText : null,
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
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return EmailInput(
          key: key,
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          labelText: l10n.emailInputLabel,
          helperText: '',
          errorText: state.email.invalid ? l10n.emailInvalidText : null,
        );
      },
    );
  }
}
