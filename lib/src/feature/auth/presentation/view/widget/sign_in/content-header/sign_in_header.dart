import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({ super.key });

  @override
  Widget build(BuildContext context) =>
  Center(
    child: Center(child: Text("sign_in".i18n(), style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white))),
  );
}