import 'package:enquantum/src/feature/auth/presentation/view/widget/sign_in/content-body/sign_in_form.dart';
import 'package:enquantum/src/feature/auth/presentation/view/widget/sign_in/content-footer/sign_in_footer.dart';
import 'package:flutter/cupertino.dart';

class SignInContentWrapper extends StatelessWidget {

  const SignInContentWrapper({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 42.0, horizontal: 8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SignInForm(),
        SignInFooter()
      ],
    ),
  );
}