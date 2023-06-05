import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: InkWell(
        onTap: () => Modular.to.navigate('/auth/reset-password'),
        child: GestureDetector(
          child: Text("reset_password_forgot_question".i18n(), style: TextStyle(color: Colors.white))
        )
      ),
    );
  }
}