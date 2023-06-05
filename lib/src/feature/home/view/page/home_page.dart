import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:localization/localization.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white
              ),
              onPressed: () {
                const storage = FlutterSecureStorage();
                storage.delete(key: "jwt");
                Modular.to.navigate("/auth/sign-in");
              },
              child: const Text('Logout'),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "welcome".i18n()
        ),
      ),
    );
  }

}