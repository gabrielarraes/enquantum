import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:enquantum/src/feature/auth/common/decoration/auth_background_decoration.dart';
import 'package:enquantum/src/feature/auth/common/widget/auth_page_header.dart';
import 'package:enquantum/src/feature/auth/presentation/view/widget/sign_in/sign_in_content_wrapper.dart';
import 'package:enquantum/src/feature/auth/presentation/viewmodel/signIn/cubit/Sign_in_cubit.dart';


class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
  Scaffold(
    resizeToAvoidBottomInset: false,
    body: BlocProvider(
      create: (context) => SignInCubit(),
      child: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthPageHeader(subTitle: "sign_in_welcome".i18n(), isNotSignPage: false,),
                  const SizedBox(height: 32.0),
                  const SignInContentWrapper()
                ]
              ),
            ),
          )
        )
      ),
    )
  );
}
