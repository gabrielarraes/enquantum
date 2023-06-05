import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class CreateAccountNavigator extends StatelessWidget {
  const CreateAccountNavigator({ super.key });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Modular.to.navigate('/auth/register');
      },
      child: GestureDetector(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("register_create_dont_have_account".i18n(), style: TextStyle(fontSize: 12.0, color: Colors.white)),
              Text("register_sign_up".i18n(), style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
                decoration: TextDecoration.underline
              )),
            ],
          ),
        ),
      ),
    );
  }
}