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
        child: Container(
          decoration: authBackgroundDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 3, child: AuthPageHeader(subTitle: "sign_in_welcome".i18n(), isNotSignPage: false,)),
                      Expanded(flex: 7, child: SignInContentWrapper())
                    ]
                  ),
                ),
              ],
            )
          ),
        )
      ),
    )
  );
}
