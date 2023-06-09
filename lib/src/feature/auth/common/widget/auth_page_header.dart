import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthPageHeader extends StatelessWidget {
  const AuthPageHeader({super.key, required this.subTitle, this.isNotSignPage = true});

  final bool isNotSignPage;
  final String subTitle;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Visibility(
        visible: isNotSignPage,
        child: ElevatedButton(
          onPressed: () => Modular.to.navigate("/auth/sign-in"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: const CircleBorder()),
            child: const Icon(Icons.arrow_back, size: 24.0),
          ),
      ),
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Text("Enquantum", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black))
            ),
            SizedBox(height: 64),
            Image(image: AssetImage('lib/assets/images/auth/auth-img.png')),
          ],
        ),
      ),
    ]
  );
}
