import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:enquantum/src/feature/auth/common/decoration/auth_input_decoration.dart';
import 'package:enquantum/src/feature/auth/presentation/view/widget/sign_in/content-body/forgot_password.dart';
import 'package:enquantum/src/feature/auth/presentation/viewmodel/signIn/cubit/Sign_in_cubit.dart';
import 'package:enquantum/src/feature/auth/presentation/viewmodel/signIn/state/sign_in_state.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) =>
  BlocBuilder<SignInCubit, SignInState>(
    builder: (context, state) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 44.0,
          child: TextFormField(
            style: const TextStyle(fontSize: 12.0, color: Colors.white),
            decoration: authInputDecoration('register_user'.i18n().toUpperCase(), (!state.status && state.username == "")),
            cursorColor: Colors.white,
            onChanged: (username) => context.read<SignInCubit>().usernameChanges(username),
          ),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 44.0,
          child: TextFormField(
            style: const TextStyle(fontSize: 12.0, color: Colors.white),
            obscureText: true,
            cursorColor: Colors.white,
            decoration: authInputDecoration('register_password'.i18n().toUpperCase(), (!state.status && state.password == "")),
            onChanged: (password) => context.read<SignInCubit>().passwordChanges(password),
          ),
        ),
        const ForgotPassword()
      ],
    )
  );
}
