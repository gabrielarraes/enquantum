import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:enquantum/src/feature/auth/presentation/view/widget/sign_in/content-footer/sign_in_footer.dart';
import 'package:enquantum/src/feature/auth/presentation/view/widget/sign_in/content-body/sign_in_form.dart';
import 'package:enquantum/src/feature/auth/presentation/view/widget/sign_in/content-header/sign_in_header.dart';

class SignInContentWrapper extends StatelessWidget {

  const SignInContentWrapper({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 42.0, horizontal: 8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        //SignInHeader(),
        SignInForm(),
        SignInFooter()
      ],
    ),
  );
}