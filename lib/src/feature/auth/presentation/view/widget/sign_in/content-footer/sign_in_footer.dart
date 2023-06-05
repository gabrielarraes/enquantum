import 'package:enquantum/src/feature/auth/presentation/view/widget/sign_in/content-footer/sign_in_register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:enquantum/src/feature/auth/presentation/view/widget/sign_in/content-footer/create_account_navigator.dart';
import 'package:enquantum/src/feature/auth/presentation/view/widget/sign_in/content-footer/sign_in_button.dart';
import 'package:enquantum/src/feature/auth/presentation/viewmodel/signIn/cubit/Sign_in_cubit.dart';
import 'package:enquantum/src/feature/auth/presentation/viewmodel/signIn/state/sign_in_state.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({ super.key });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  const [
            SignInButton(),
            SignInRegisterButton(),
          ],
        );
      },
    );
  }
}